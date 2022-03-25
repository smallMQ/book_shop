# Create your views here.
from rest_framework.viewsets import ModelViewSet, GenericViewSet
from rest_framework.mixins import CreateModelMixin, ListModelMixin,DestroyModelMixin
from rest_framework.views import APIView
from .models import Book, Category
from . import models
from .ser import book_ser, Category_ser
from rest_framework.filters import SearchFilter
from rest_framework.pagination import PageNumberPagination
from dj_pro.utils.response import Response
from rest_framework.filters import OrderingFilter
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from django.db.models import F
from dj_pro import settings


# 获取图书的api视图
class Book_api(GenericViewSet, ListModelMixin,CreateModelMixin,DestroyModelMixin):
    queryset = Book.objects.all()
    serializer_class = book_ser
    pagination_class = PageNumberPagination
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    ordering_fields = ['id', 'price']
    filter_fields = ['category','author' ]

    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())
        queryset = queryset.filter(number__gt = 0)
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)





class Category_api(GenericViewSet, ListModelMixin):
    queryset = Category.objects.all()
    serializer_class = Category_ser
    pagination_class = None


# 支付的视图
class PayView(GenericViewSet, CreateModelMixin):
    queryset = models.order.objects.all()
    serializer_class = None
    authentication_classes = [JSONWebTokenAuthentication, ]
    pagination_class = None

    def create(self, request, *args, **kwargs):
        book_id = request.data['book']
        price = request.data['price']
        name = request.data['name']
        user = request.user
        # 生成订单号
        import uuid
        former = str(uuid.uuid4()).replace('-', '')
        later = str(request.data['name'])
        print(former + later)
        order_num = former + later

        # 生成支付链接
        from dj_pro.libs.ali_pay.pay import alipay, gateway
        order_string = alipay.api_alipay_trade_page_pay(
            out_trade_no=order_num,
            total_amount=float(price),
            subject=name,
            return_url=settings.RETURN_URL,  # get回调，前台地址
            notify_url=settings.NOTIFY_URL # post回调，后台地址
        )
        pay_url = gateway + order_string
        order = models.order.objects.create(user=user, num=order_num, book_id=book_id)
        return Response(pay_url)


# 支付成功的视图
class SuccessView(APIView):
    def get(self, request, *args, **kwargs):
        # 对数据库进行操作,生成订单
        out_trade_no = request.query_params.get('out_trade_no')
        book_name = out_trade_no[32:]
        book_1 = models.Book.objects.filter(name=book_name).first()
        book = models.Book.objects.filter(id=book_1.id).update(number=F('number') - 1)

        return Response(True)

    def post(self, request, *args, **kwargs):
        '''
        支付宝回调接口
        '''
        print('2')
        from dj_pro.libs.ali_pay import pay

        data = request.data
        out_trade_no = data.get('out_trade_no', None)
        gmt_payment = data.get('gmt_payment', None)
        signature = data.pop("sign")
        # 验证签名
        success = pay.verify(data, signature)
        if success and data["trade_status"] in ("TRADE_SUCCESS", "TRADE_FINISHED"):
            models.order.objects.filter(num=out_trade_no).update(order_status=1, pay_time=gmt_payment)
            return Response('success')
        else:
            return Response('error')


# 搜索视图
class BookSearchView(GenericViewSet, ListModelMixin):
    queryset = models.Book.objects.all()
    serializer_class = book_ser
    pagination_class = PageNumberPagination
    filter_backends = [SearchFilter]
    search_fields = ['name', 'author']

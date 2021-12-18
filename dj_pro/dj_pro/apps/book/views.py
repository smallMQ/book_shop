from django.shortcuts import render

# Create your views here.
from rest_framework.viewsets import ModelViewSet,GenericViewSet
from rest_framework.mixins import CreateModelMixin,ListModelMixin
from rest_framework.views import APIView
from .models import Book
from . import models
from .ser import book_ser
from rest_framework.filters import SearchFilter
from rest_framework.pagination import PageNumberPagination
from dj_pro.utils.response import Response
from rest_framework.decorators import action
from .ser import Pay_ser
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from django.db.models import F
from dj_pro import settings
class Book_api(GenericViewSet,ListModelMixin):
    queryset = Book.objects.all()
    serializer_class = book_ser
    pagination_class = PageNumberPagination
    ordering_fields = ['id', 'price']



class PayView(GenericViewSet,CreateModelMixin):
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

        #生成支付链接
        from dj_pro.libs.ali_pay.pay import alipay, gateway
        order_string = alipay.api_alipay_trade_page_pay(
            out_trade_no=order_num,
            total_amount=float(price),
            subject=name,
            return_url=settings.RETURN_URL,  # get回调，前台地址
            notify_url=settings.NOTIFY_URL  # post回调，后台地址
        )
        pay_url = gateway + order_string
        order = models.order.objects.create(user=user, num=order_num, book_id=book_id)
        # my_ser = self.get_serializer(data=request.data,context={'request':request})
        # print(type(request.data))
        # print('2')
        # if my_ser.is_valid():
        #     print('3')
        #     # print(request.data)
        #     order_num = my_ser.context.get('order_num')
        #     user = request.user
        #     book_id = my_ser.context.get('book')
        #     print(order_num)
        #     order = models.order.objects.create(user=request.user,num=order_num,book_id=request.data['book'])
        #     print('创建订单成功')
        # else:
        #     print('no')
        return Response(pay_url)
    # 生成订单号











class SuccessView(APIView):
    def get(self,request,*args,**kwargs):
        # 对数据库进行操作,生成订单
        out_trade_no = request.query_params.get('out_trade_no')
        book_name = out_trade_no[32:]
        book = models.Book.objects.filter(name=book_name).first()
        book = models.Book.objects.filter(id=book.id).update(number=F('number')-1)
        print(book_name)
        return Response(True)


    def post(self,request,*args,**kwargs):
        '''
        支付宝回调接口
        '''
        print('2')
        from dj_pro.libs.ali_pay import pay
        # from luffy_api.utils import logging
        data = request.data
        out_trade_no=data.get('out_trade_no',None)
        gmt_payment=data.get('gmt_payment',None)
        signature = data.pop("sign")
        # 验证签名
        success = pay.verify(data, signature)
        if success and data["trade_status"] in ("TRADE_SUCCESS", "TRADE_FINISHED"):
            models.order.objects.filter(num=out_trade_no).update(order_status=1,pay_time=gmt_payment)
            # logging.info('%s订单支付成功'%out_trade_no)

            return Response('success')
        else:
            # logging.info('%s订单有问题' % out_trade_no)
            return Response('error')


# 搜索
class BookSearchView(GenericViewSet,ListModelMixin):
    queryset = models.Book.objects.all()
    serializer_class = book_ser
    pagination_class = PageNumberPagination
    filter_backends=[SearchFilter]
    search_fields=['name','author']

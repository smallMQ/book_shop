from django.shortcuts import render

# Create your views here.
from . import models
from . import ser
from rest_framework.viewsets import ModelViewSet,GenericViewSet
from rest_framework.mixins import CreateModelMixin,UpdateModelMixin
from rest_framework.filters import SearchFilter
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from dj_pro import settings
class OldBookView(ModelViewSet):
    pagination_class = None
    queryset = models.OldBook.objects.all()
    serializer_class = ser.OldBookSer
    filter_backends = [SearchFilter]
    search_fields =['name']


# 支付的视图
class PayView(GenericViewSet, CreateModelMixin):
    # queryset = models.order.objects.all()
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
            return_url=settings.RETURN_URL_O,  # get回调，前台地址
            notify_url=settings.NOTIFY_URL_O  # post回调，后台地址
        )

        pay_url = gateway + order_string
        print(pay_url)
        # order = models.order.objects.create(user=user, num=order_num, book_id=book_id)
        return Response(pay_url)


# 支付成功的视图
class Success(APIView):
    def get(self, request, *args, **kwargs):
        # 对数据库进行操作,生成订单
        out_trade_no = request.query_params.get('out_trade_no')
        book_name = out_trade_no[32:]
        print(book_name)
        book = models.OldBook.objects.filter(name=book_name).first()
        book.is_sell = True
        user_obj = models.UserInfo.objects.filter(username=request.user).first()
        book.buy_user = user_obj
        book.save()

        return Response(True)

    def post(self, request, *args, **kwargs):
        '''
        支付宝回调接口
        '''
        from dj_pro.libs.ali_pay import pay

        data = request.data
        out_trade_no = data.get('out_trade_no', None)
        gmt_payment = data.get('gmt_payment', None)
        signature = data.pop("sign")
        # 验证签名
        success = pay.verify(data, signature)
        if success and data["trade_status"] in ("TRADE_SUCCESS", "TRADE_FINISHED"):
            # models.order.objects.filter(num=out_trade_no).update(order_status=1, pay_time=gmt_payment)
            return Response('success')
        else:
            return Response('error')



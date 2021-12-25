# coding:utf-8

from rest_framework.serializers import ModelSerializer
from rest_framework import serializers
from dj_pro import settings
from . import models

# 获取图书的序列化类
class book_ser(ModelSerializer):
    class Meta:
        model = models.Book
        fields = '__all__'


class Category_ser(ModelSerializer):
    class Meta:
        model = models.Category
        fields = '__all__'


# 获取支付时前端所传过来的序列化类,本来要用,最后由于一点bug没用
class Pay_ser(ModelSerializer):
    price = serializers.DecimalField(max_digits=5,decimal_places=2)
    name = serializers.CharField(max_length=32)
    class Meta:
        model = models.order
        fields = ['book','price','name']
        extra_kwargs ={
            'price':{'read_only':True},
            'name':{'read_only':True}
        }
    # 生成订单号
    def _create_order(self,attrs):

        import uuid
        former = str(uuid.uuid4()).replace('-','')
        later = str(attrs.get('book'))
        print(former+later)
        return former+later

    # 获取用户
    def _get_user(self):
        request = self.context.get('request')
        return request.user
    # 生成支付链接
    def _gen_pay_url(self, out_trade_no, total_amount, subject):
        # total_amount是Decimal类型，识别不了，需要转换成float类型
        from dj_pro.libs.ali_pay.pay import alipay, gateway
        order_string = alipay.api_alipay_trade_page_pay(
            out_trade_no=out_trade_no,
            total_amount=float(total_amount),
            subject=subject,
            return_url=settings.RETURN_URL,  # get回调，前台地址
            notify_url=settings.NOTIFY_URL  # post回调，后台地址
        )
        return gateway + order_string
    # 入库
    def _before_create(self,attrs,user,order_num,pay_url):
        attrs['user'] = user
        attrs['order_num'] = order_num
        attrs['pay_url'] = pay_url
        self.context['user'] = user
        self.context['order_num'] = order_num
    def validate(self, attrs):
        print('1234')
        book = attrs.get('book')
        self.context['book'] = book
        print('查询成功')
        order_num = self._create_order(attrs)
        print('生成订单成功')
        user = self._get_user()
        print('查找用户成功')
        pay_url = self._gen_pay_url(order_num,book.price,book.name)
        print('生成支付链接成功')
        self.context['pay_url'] = pay_url
        self._before_create(attrs,user,order_num,pay_url)
        return attrs








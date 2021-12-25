from django.db import models
from user.models import UserInfo
# Create your models here.
# 图书分类
class Category(models.Model):
    class_name = models.CharField(max_length=32,verbose_name='分类名')

    def __str__(self):
        return self.class_name

    class Meta:
        verbose_name = '分类表'
        verbose_name_plural = '分类表'
# 图书表
class Book(models.Model):
    '''图书'''
    name = models.CharField(max_length=32,verbose_name='书名')
    price = models.DecimalField(max_digits=5,decimal_places=2,verbose_name='价格')
    number = models.IntegerField(verbose_name='数量')
    publisher = models.CharField(max_length=32,verbose_name='出版社')
    image = models.ImageField(upload_to='book',verbose_name='书的图片',default='book/default.jpg')
    author = models.CharField(max_length=32,verbose_name='作者',null=True)
    category = models.ForeignKey(to=Category,verbose_name='分类',on_delete=models.DO_NOTHING)
    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '图书表'
        verbose_name_plural = '图书表'



# 订单表
class order(models.Model):
    '''订单'''
    create_time = models.DateTimeField(auto_now_add=True,verbose_name='订单创建时期')
    user = models.ForeignKey(to=UserInfo,verbose_name='用户',on_delete=models.DO_NOTHING)
    book = models.ForeignKey(to=Book,verbose_name='图书',on_delete=models.DO_NOTHING)
    num = models.CharField(max_length=64,verbose_name='订单号',default='1001')
    def __str__(self):
        return self.num

    class Meta:
        verbose_name = '订单表'
        verbose_name_plural = '订单表'
from django.db import models

# Create your models here.
from user.models import UserInfo


class OldBook(models.Model):
    '''
    二手书表
    '''
    name = models.CharField(max_length=32,verbose_name='书名')
    simple_introduce = models.CharField(max_length=64,verbose_name='简介')
    price = models.CharField(max_length=12,verbose_name='价格')
    is_sell = models.BooleanField(default=False,verbose_name='是否卖出')
    image = models.ImageField(upload_to='old_book',verbose_name='书的图片',blank=True,null=True,default='old_book/3e2c4d4f20c0113f68b826bd3cbf55a4_L9N5DNc.jpeg')
    sell_user = models.ForeignKey(to=UserInfo,verbose_name='卖书的人',on_delete=models.SET_NULL,related_name='sell_user',blank=True,null=True)
    buy_user = models.ForeignKey(to=UserInfo,verbose_name='买到书的人',null=True,blank=True,on_delete=models.SET_NULL,related_name='buy_user')
    create_time = models.DateField(auto_now_add=True,verbose_name='创建时间')


    def __str__(self):
        return self.name


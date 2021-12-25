from django.db import models

# Create your models here.

# 前端轮播图表
class banner(models.Model):
    image = models.ImageField(upload_to='banner',verbose_name='图片')
    alt = models.CharField(max_length=32,verbose_name='替代信息')

    def __str__(self):
        return self.alt

    class Meta:
        verbose_name = '首页轮播图表'
        verbose_name_plural = '首页轮播图表'
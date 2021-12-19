# coding:utf-8
from rest_framework.serializers import ModelSerializer
from .models import banner

# 轮播图序列化类
class banner_ser(ModelSerializer):
    class Meta:
        model = banner
        fields = '__all__'

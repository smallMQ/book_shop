from django.shortcuts import render

# Create your views here.
from rest_framework.viewsets import ModelViewSet
from .models import banner
from .ser import banner_ser

# 获取轮播图的视图
class banner_view(ModelViewSet):
    pagination_class = None
    serializer_class = banner_ser
    queryset = banner.objects.all()[:3]



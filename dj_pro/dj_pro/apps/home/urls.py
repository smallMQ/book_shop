

from django.urls import path,include
from . import views
from rest_framework.routers import  SimpleRouter
router=SimpleRouter()
# 注册轮播图的路由
router.register('banner',views.banner_view,'banner')
urlpatterns = [

    path('', include(router.urls)),
]


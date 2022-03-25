# coding:utf-8



from django.urls import path,include
from . import views
from rest_framework.routers import  SimpleRouter
router=SimpleRouter()
# 注册轮播图的路由
router.register('oldbook',views.OldBookView,'oldbook')
router.register('pay', views.PayView, 'pay')

urlpatterns = [
# path('delete/(?P<pk>\d/$)',views.DeleteOldBookView.as_view({'delete':'destroy'})),
    path('success/',views.Success.as_view()),
    path('', include(router.urls)),
]



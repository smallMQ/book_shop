"""dj_pro URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.urls import path,include
from . import views
from rest_framework.routers import  SimpleRouter
router=SimpleRouter()
# 注册获取图书的路由
router.register('book',views.Book_api,'book')
# 注册获取搜索结果的路由
router.register('search',views.BookSearchView,'search')
# 注册支付的路由
router.register('pay', views.PayView, 'pay')
urlpatterns = [
    # 支付成功的路由
    path('success/',views.SuccessView.as_view()),
    # 注册上边注册的所有路由
    path('', include(router.urls)),

    # path('pay/',views.PayView.as_view())
]


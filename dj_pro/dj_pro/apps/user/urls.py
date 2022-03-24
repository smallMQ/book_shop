'''
作者:smallMQ

'''
from django.urls import path,re_path,include
from . import views
from rest_framework.routers import SimpleRouter
router = SimpleRouter()
from rest_framework_jwt.views import obtain_jwt_token

# 注册用户的登录,验证码,注册路由
router.register('',views.LoginView,'login')
router.register('',views.SmsView,'send')
router.register('',views.RegisterView,'register')

urlpatterns = [
        path('',include(router.urls)),
        path('log',obtain_jwt_token),
        path('changemsg/',views.ChangePassword.as_view())
]

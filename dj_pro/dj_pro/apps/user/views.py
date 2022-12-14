from dj_pro.utils import response
from rest_framework.decorators import action
from django.core.cache import cache
from rest_framework.viewsets import ViewSet
from rest_framework_jwt.serializers import jwt_encode_handler, jwt_payload_handler
from . import ser
from . import models
import re
from dj_pro.libs.tx_sms import send_sms
from rest_framework.views import APIView
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework.permissions import IsAuthenticated
# 登录视图
class LoginView(ViewSet):
    # 登录
    @action(methods=['POST'], detail=False)
    def login(self, request, *args, **kwargs):
        ser_obj = ser.UserModelSerializer(data=request.data)
        if ser_obj.is_valid():
            token = ser_obj.context['token']
            username = ser_obj.context['user'].username
            user = ser_obj.context['user']
            return response.ApiResponse(token=token, username=username, is_superuser=user.is_superuser,user_id = user.id)
        else:
            return response.ApiResponse(code=0, msg=ser_obj.errors)

    # 手机号验证
    @action(methods=['GET'], detail=False)
    def check_telephone(self, request):
        telephone = request.query_params.get('telephone')
        if re.match('^1[3-9][0-9]{9}$', telephone):
            user = models.UserInfo.objects.filter(telephone=telephone).first()
            if user:
                return response.ApiResponse(result=True)
            else:
                return response.ApiResponse(result=False)
        else:
            return response.ApiResponse(code=0, msg='手机号不合法')


class SmsView(ViewSet):
    # 如果项目要上线,最好加上下边的频率限制类,该类没有写^_^
    # throttle_classes = [throttlings.SmsThrotting]
    # 发送验证码
    @action(methods=['GET'], detail=False)
    def send_sms(self, request):
        telephone = request.query_params.get('telephone')
        if re.match('^1[3-9][0-9]{9}$', telephone):
            user = models.UserInfo.objects.filter(telephone=telephone).first()
            # print(user.username)
            if user:
                print('用户存在')
                code = send_sms.get_code()
                if send_sms.send(code, telephone):
                    cache.set('code', code, 60)
                    print(cache.get('code'))
                    return response.ApiResponse(code=100, msg='发送验证码成功')
                else:

                    return response.ApiResponse(msg='未知错误')
            else:
                print('用户不存在')
                return response.ApiResponse(code=2, msg='手机号不存在')
        else:
            return response.ApiResponse(msg='号码不符合规范,傻der')

    # 验证码登录
    @action(methods=['POST'], detail=False)
    def sms_login(self, request):
        telephone = request.data['telephone']
        code = request.data['code']
        if str(code) == str(cache.get('code')):
            user = models.UserInfo.objects.filter(telephone=telephone).first()
            if user:
                # 获取签发
                payload = jwt_payload_handler(user)
                # 签发encode成token
                token = jwt_encode_handler(payload)
                return response.ApiResponse(token=token, username=user.username, is_superuser=user.is_superuser)
            else:
                return response.ApiResponse(code=0, msg='用户不存在')
        else:
            return response.ApiResponse(code=2, msg='验证码过期或者不正确')


class RegisterView(ViewSet):
    # 注册
    @action(methods=['POST'], detail=False)
    def register(self, request):
        ser_obj = ser.RegisterSerializer(data=request.data)
        telephone = request.data['telephone']
        password = request.data['password']
        if ser_obj.is_valid():
            user = models.UserInfo.objects.create_user(username=telephone, telephone=telephone, password=password)
            token = self._get_token(user)
            return response.ApiResponse(msg='注册成功', token=token, username=user.username)
        else:
            return response.ApiResponse(code=0, msg='用户已经存在或者手机号不合法或者验证码不正确')

    # 注册通过验证码注册
    @action(methods=['GET'], detail=False)
    def register_send_sms(self, request):
        telephone = request.query_params.get('telephone')
        if re.match('^1[3-9][0-9]{9}$', telephone):
            user = models.UserInfo.objects.filter(telephone=telephone).first()
            code = send_sms.get_code()
            if send_sms.send(code, telephone):
                # if 1:
                cache.set('code', code, 60)
                print(cache.get('code'))
                return response.ApiResponse(code=100, msg='发送验证码成功')
            else:
                return response.ApiResponse(msg='未知错误')
        else:
            return response.ApiResponse(msg='号码不符合规范,傻der')

    def _get_token(self, user):
        # 获取签发
        payload = jwt_payload_handler(user)
        # 签发encode成token
        token = jwt_encode_handler(payload)
        return token


class ChangePassword(APIView):
    authentication_classes = [JSONWebTokenAuthentication]
    permission_classes = [IsAuthenticated]
    def post(self,request):

        msg = request.data

        user_obj = models.UserInfo.objects.filter(username=msg['user']).first()
        if msg['username'] == msg['user']:
            if msg['password'] == msg['check_password']:
                user_obj.set_password(msg['password'])
                user_obj.save()
            else:
                return response.Response({'code':400})
        else:
            if msg['password'] == msg['check_password']:
                user_obj.set_password(msg['password'])
                if msg['username'] == '':
                    return response.Response({'code': 0})
                else:
                    if (re.match('^1[3-9][0-9]{9}$', msg['username'])):
                        return response.Response({'code': 1})
                    user_obj.username=msg['username']
                user_obj.save()
            else:
                return response.Response({'code':400})

        return response.Response({'code':0})





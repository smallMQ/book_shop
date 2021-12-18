# coding:utf-8


from rest_framework.serializers import ModelSerializer
from rest_framework import serializers
from rest_framework_jwt.serializers import jwt_payload_handler,jwt_encode_handler
from rest_framework.exceptions import ValidationError
from django.core.cache import cache
import datetime

from . import models
class UserModelSerializer(ModelSerializer):
    username = serializers.CharField(max_length=32)

    class Meta:
        model = models.UserInfo
        fields = ['username', 'password', 'id']
        extra_kwargs = {
            'id': {'read_only': True},
            'password': {'write_only': True}
        }

    def validate(self, attrs):
        # 验证用户
        user = self._get_user(attrs)
        # 签发token
        token = self._get_token(user)
        # 将验证后的数据保存下来,给视图使用
        self.context['token'] = token
        self.context['user'] = user
        return attrs

    def _get_user(self, attrs):
        username = attrs.get('username')
        password = attrs.get('password')
        import re
        # 后台验证账号类型
        if re.match('^1[3-9][0-9]{9}$', username):
            user = models.UserInfo.objects.filter(telephone=username).first()
        elif re.match('^.*@.*$', username):
            user = models.UserInfo.objects.filter(email=username).first()
        else:
            user = models.UserInfo.objects.filter(username=username).first()
        if user:
            ret = user.check_password(password)
            if ret:
                user.last_login = datetime.datetime.now()
                user.save()
                return user
            else:
                raise ValidationError('密码错误')
        else:
            raise ValidationError('用户不存在')

    def _get_token(self, user):
        # 获取签发
        payload = jwt_payload_handler(user)
        # 签发encode成token
        token = jwt_encode_handler(payload)
        return token


class RegisterSerializer(serializers.ModelSerializer):
    code = serializers.CharField(max_length=4)

    class Meta:
        model = models.UserInfo
        fields = ['telephone', 'code', 'password']
        extra_kwargs = {
            'password': {'write_only': True, 'max_length': 11, 'min_length': 3}
        }

    def validate(self, attrs):
        code = attrs.get('code')
        telephone = attrs.get('telephone')
        password = attrs.get('password')
        import re
        if re.match('^1[3-9][0-9]{9}$', telephone):
            user = models.UserInfo.objects.filter(telephone=telephone).first()
            if user:
                raise ValidationError('用户已经存在')
            if code == cache.get('code'):
                return attrs
            else:
                raise ValidationError('验证码不正确')
        else:
            return ValidationError('手机号不合法')
        return attrs
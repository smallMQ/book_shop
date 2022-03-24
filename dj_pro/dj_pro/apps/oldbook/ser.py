# coding:utf-8

from rest_framework.serializers import ModelSerializer
from rest_framework import serializers
from . import models
from django.db import models as mod

class user_ser(ModelSerializer):
    class Meta:
        model = models.UserInfo
        fields = ['id','username']
        # read_only_fields = ['username']

# from user import ser
class OldBookSer(ModelSerializer):
    sell_user = serializers.CharField()
    buy_user = serializers.CharField(read_only=True)

    class Meta:
        model = models.OldBook
        # fields = ['name','simple_introduce','is_sell','sell_user','buy_user','create_time','price','image']
        fields = ['id','name','simple_introduce','is_sell','sell_user','buy_user','create_time','price','image']
    def create(self, validated_data):
        sell_user = validated_data.pop('sell_user')
        sell_user_obj = models.UserInfo.objects.filter(username=sell_user).first()
        old_book = models.OldBook.objects.create(**validated_data)
        old_book.sell_user=sell_user_obj
        old_book.save()
        return old_book

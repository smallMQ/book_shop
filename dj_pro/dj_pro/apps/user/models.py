from django.db import models


from django.contrib.auth.models import AbstractUser

# 用户表
class UserInfo(AbstractUser):
    telephone = models.CharField(max_length=11)
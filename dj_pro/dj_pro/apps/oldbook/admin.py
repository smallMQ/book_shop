from django.contrib import admin
from django.contrib.admin import ModelAdmin
# Register your models here.
from . import models
class OldBookAdmin(ModelAdmin):
    list_display = ['name','price','is_sell','sell_user','buy_user','create_time']
    search_fields = ['name']


admin.site.register(models.OldBook,OldBookAdmin)
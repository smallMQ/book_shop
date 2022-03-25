from django.contrib import admin
from django.contrib.admin import ModelAdmin
class BookAdmin(ModelAdmin):
    list_display = ['name','price','number','publisher','author','create_time']
    search_fields = ['name']

class OrderAdmin(ModelAdmin):
    list_display = ['user','book','num','create_time']
    search_fields = ['user','book']


# Register your models here.
from . import models
admin.site.register(models.Category)
admin.site.register(models.Book,BookAdmin)
admin.site.register(models.order,OrderAdmin)

admin.site.site_header = '书店管理'
admin.site.site_title = '书店管理'
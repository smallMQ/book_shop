from django.contrib import admin

# Register your models here.
from . import models
admin.site.register(models.Category)
admin.site.register(models.Book)
admin.site.register(models.order)

admin.site.site_header = '书店管理'
admin.site.site_title = '书店管理'
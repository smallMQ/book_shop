from django.db import models

# Create your models here.

class banner(models.Model):
    image = models.ImageField(upload_to='banner',verbose_name='图片')
    alt = models.CharField(max_length=32,verbose_name='替代信息')

    def __str__(self):
        return self.alt


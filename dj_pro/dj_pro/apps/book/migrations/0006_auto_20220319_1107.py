# Generated by Django 3.2.4 on 2022-03-19 11:07

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('book', '0005_alter_order_book'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='book',
            options={'verbose_name': '图书表', 'verbose_name_plural': '图书表'},
        ),
        migrations.AlterModelOptions(
            name='category',
            options={'verbose_name': '分类表', 'verbose_name_plural': '分类表'},
        ),
        migrations.AlterModelOptions(
            name='order',
            options={'verbose_name': '订单表', 'verbose_name_plural': '订单表'},
        ),
    ]

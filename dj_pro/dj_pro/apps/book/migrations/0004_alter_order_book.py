# Generated by Django 3.2.4 on 2021-12-18 13:48

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('book', '0003_order_num'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='book',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='book.book', verbose_name='图书'),
        ),
    ]

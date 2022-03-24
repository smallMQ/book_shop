# Generated by Django 3.2.4 on 2022-03-19 16:39

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('oldbook', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='oldbook',
            name='buy_user',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='buy_user', to=settings.AUTH_USER_MODEL, verbose_name='买到书的人'),
        ),
        migrations.AlterField(
            model_name='oldbook',
            name='sell_user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='sell_user', to=settings.AUTH_USER_MODEL, verbose_name='卖书的人'),
        ),
    ]
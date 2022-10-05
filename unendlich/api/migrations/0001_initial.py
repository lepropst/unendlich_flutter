# Generated by Django 4.1.1 on 2022-10-04 23:29

import django.contrib.postgres.fields
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='NoteBook',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('label', models.CharField(max_length=100)),
                ('dateEdited', models.CharField(max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name='Note',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('label', models.CharField(max_length=100)),
                ('dateEdited', models.CharField(max_length=10)),
                ('content', django.contrib.postgres.fields.ArrayField(base_field=models.TextField(max_length=10000), size=None)),
                ('notebook', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.notebook')),
            ],
        ),
    ]

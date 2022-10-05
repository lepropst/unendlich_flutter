
from django.contrib.postgres.fields import ArrayField
from django.db import models

# Create your models here.


class NoteBook(models.Model):
    label = models.CharField(max_length=100)
    dateEdited = models.CharField(max_length=10)

    def __str__(self):
        return self.label


class Note(models.Model):
    notebook = models.ForeignKey(NoteBook, on_delete=models.CASCADE)
    label = models.CharField(max_length=100)
    dateEdited = models.CharField(max_length=10)
    content = ArrayField(base_field=models.TextField(max_length=10000))

    def __str__(self):
        return self.label

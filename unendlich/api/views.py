from tkinter.ttk import Notebook
from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets

from .serializers import NoteSerializer, NoteBookSerializer
from .models import NoteBook, Note


class NoteBookViewSet(viewsets.ModelViewSet):
    queryset = NoteBook.objects.all().order_by('label')
    serializer_class = NoteBookSerializer

    # def post(self, request, *args, **kwargs):
    #     '''
    #     Create the Todo with given todo data
    #     '''

    #     data = {
    #         'task': request.data.get('label'),
    #         'completed': request.data.get('dateEdited'),
    #     }
    #     return data


class NoteViewSet(viewsets.ModelViewSet):
    queryset = Note.objects.all().order_by('label')
    serializer_class = NoteSerializer

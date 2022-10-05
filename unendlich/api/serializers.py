from rest_framework import serializers

from .models import Note, NoteBook


class NoteSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Note
        fields = ['notebook_id', 'label', 'dateEdited', 'content']


class NoteBookSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = NoteBook
        fields = ['id', 'label', 'dateEdited']

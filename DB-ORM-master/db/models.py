from django.db import models

class Director(models.Model):
    name = models.TextField(null=True,default='')
    debut = models.DateTimeField(null=True,default='')
    country = models.TextField(null=True,default='')

class Genre(models.Model):
    title = models.TextField(null=True,default='')

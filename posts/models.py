import datetime

from django.db import models


class Post(models.Model):
    title = models.CharField(max_length=256)
    date = models.DateField()
    content = models.TextField()


from django.shortcuts import render

# Create your views here.
from rest_framework.views import APIView
from rest_framework import status
from rest_framework.response import Response
from datetime import datetime

class IndexView(APIView):

    def get(self, request):
        data = {"ind":"ROBO FRAME WORK"}
        print("Got request at",datetime.now())
        return Response(data=data,status=status.HTTP_200_OK)
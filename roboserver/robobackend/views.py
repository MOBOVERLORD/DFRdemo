from django.shortcuts import render

# Create your views here.
from rest_framework.views import APIView
from rest_framework import status
from rest_framework.response import Response


class IndexView(APIView):

    def get(self, request):
        data = {"ind":"ROBO FRAME WORK"}
        
        return Response(data=data,status=status.HTTP_200_OK)
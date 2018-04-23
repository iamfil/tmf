from django.conf import settings
import requests
import json

def getCommerceLiteModels(model: str):
    response = requests.get(url = "{0}{1}".format(settings.COMMERCE_LITE_API_ENDPOINT, model), headers = {"content-type": "application/json"})
    return response.json()

def getCommerceLiteModel(model: str, id: str):
    response = requests.get(url = "{0}{1}/{2}".format(settings.COMMERCE_LITE_API_ENDPOINT, model, id), headers = {"content-type": "application/json"})
    return response.json()

#ignoreee

def createCommerceLiteModel(model):
    response = requests.get(url = "http://commercelite-api/api/{0}".format(model))
    return requests.json()

def updateCommerceLiteModel(model):
    response = requests.get(url = "http://commercelite-api/api/{0}".format(model))
    return requests.json()

def deleteCommerceLiteModel(model):
    response = requests.get(url = "http://commercelite-api/api/{0}".format(model))
    return requests.json()

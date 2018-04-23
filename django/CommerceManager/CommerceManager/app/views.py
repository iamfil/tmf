"""
Definition of views.
"""

from django.shortcuts import render
from django.http import HttpRequest
from django.template import RequestContext
from django.core.serializers.json import DjangoJSONEncoder
from datetime import datetime
import json
from app import services

def home(request):
    """Renders the home page."""
    assert isinstance(request, HttpRequest)
    return render(request,
        'app/index.html',
        {
            'title':'Home Page',
            'year':datetime.now().year,
        })

# Customer Views
def customersIndex(request):
    assert isinstance(request, HttpRequest)

    list = services.getCommerceLiteModels("Customers")

    return render(request,
        'app/customers/index.html',
        {
            'title': 'Customers',
            'customerList': json.dumps(list, cls=DjangoJSONEncoder)
        })

def customerCreate(request):
    assert isinstance(request, HttpRequest)

def customerDelete(request):
    assert isinstance(request, HttpRequest)


# Product Views
def productsIndex(request):
    assert isinstance(request, HttpRequest)

    list = services.getCommerceLiteModels("Products")

    return render(request,
        'app/products/index.html',
        {
            'title': 'Products',
            'productsList': json.dumps(list, cls=DjangoJSONEncoder)
        })

# Product Type Views
def producttypesIndex(request):
    assert isinstance(request, HttpRequest)

    list = services.getCommerceLiteModels("ProductTypes")

    return render(request,
        'app/producttypes/index.html',
        {
            'title': 'Product Types',
            'productTypesList': json.dumps(list, cls=DjangoJSONEncoder)
        })

# Order Views
def ordersIndex(request):
    assert isinstance(request, HttpRequest)

    list = services.getCommerceLiteModels("Orders")

    return render(request,
        'app/orders/index.html',
        {
            'title': 'Orders',
            'orderList': json.dumps(list, cls=DjangoJSONEncoder)
        })

# Offer Views
def offersIndex(request):
    assert isinstance(request, HttpRequest)

    list = services.getCommerceLiteModels("Offers")

    return render(request,
        'app/offers/index.html',
        {
            'title': 'Offers',
            'offerList': json.dumps(list, cls=DjangoJSONEncoder)
        })



from flask import Flask, g
import mysql.connector
from config import DATABASES
from product.model.product_dao import ProductDao
from product.service.product_service import ProductService
from product.view.product_view import ProductView
from seller.model.seller_dao import SellerDao
from seller.service.seller_service import SellerService
from seller.view.seller_view import SellerView

class Services:
    pass

def get_db():
    if 'db' not in g:
        g.db = mysql.connector.connect(user=DATABASES['user'], password=DATABASES['password'], host=DATABASES['host'],database=DATABASES['database'])

    return g.db

def create_app():
    app = Flask(__name__)

    # DataModel layer
    product_dao = ProductDao(get_db)
    seller_dao = SellerDao(get_db)

    # Service layer
    services = Services
    services.product_service = ProductService(product_dao)
    services.seller_service = SellerService(seller_dao)

    # Create endpoints
    ProductView.create_endpoints(app, services)
    SellerView.create_endpoints(app, services)

    return app

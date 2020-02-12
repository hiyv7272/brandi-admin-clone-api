from flask import Flask, g
from flask_cors    import CORS

import mysql.connector
from config import S3_CONFIG
from config import DATABASES
from static.swagger_ui import SWAGGERUI_BLUEPRINT, SWAGGER_URL
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

def make_config(app):
    app.config['S3_BUCKET'] = S3_CONFIG['S3_BUCKET']
    app.config['S3_ACCESS_KEY'] = S3_CONFIG['S3_ACCESS_KEY']
    app.config['S3_SECRET_KEY'] = S3_CONFIG['S3_SECRET_KEY']
    app.config['S3_BUCKET_URL'] = S3_CONFIG['S3_BUCKET_URL']
    return

def create_app():
    app = Flask(__name__)
    make_config(app)
    CORS(app)

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

    # Swagger ui
    app.register_blueprint(SWAGGERUI_BLUEPRINT, url_prefix=SWAGGER_URL)
    return app
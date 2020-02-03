from flask import Flask

class ProductView:

    def create_endpoints(app, services):

        product_service  = services.product_service

        @app.route("/product/ping", methods=['GET'])
        def product_ping():
            product_service.test_product_service()
            return "pong"

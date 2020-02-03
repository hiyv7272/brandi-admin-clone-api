from flask import Flask

class SellerView:

    def create_endpoints(app, services):

        seller_service  = services.seller_service

        @app.route("/seller/ping", methods=['GET'])
        def seller_ping():
            seller_service.test_seller_service()
            return "pong"

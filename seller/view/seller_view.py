from flask      import request, jsonify
from flask.json import JSONEncoder

class CustomJSONEncoder(JSONEncoder):
    def default(self, obj):
        if isinstance(obj, set):
            return list(obj)

        return JSONEncoder.default(self, obj)

class SellerView:

    def create_endpoints(app, services):

        seller_service  = services.seller_service

        @app.route("/seller/sign-up", methods=['POST'])
        def sign_up():
            new_seller = request.json
            new_seller = seller_service.create_new_seller(new_seller)

            return jsonify(new_seller)
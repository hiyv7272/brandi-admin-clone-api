from flask      import request, jsonify
from flask.json import JSONEncoder

class InvalidUsage(Exception):
    status_code = 400

    def __init__(self, message, status_code=None, payload=None):
        Exception.__init__(self)
        self.message = message
        if status_code is not None:
            self.status_code = status_code
        self.payload = payload
 
    def to_dict(self):
        rv = dict(self.payload or ())
        rv['message'] = self.message
        return rv

class CustomJSONEncoder(JSONEncoder):
    def default(self, obj):
        if isinstance(obj, set):
            return list(obj)

        return JSONEncoder.default(self, obj)

class SellerView:

    def create_endpoints(app, services):

        app.json_encoder = CustomJSONEncoder
        seller_service  = services.seller_service

        @app.errorhandler(404)
        def page_not_found(error):
            return "INVALID_URL", 404
        
        @app.errorhandler(405)
        def method_not_allowed(error):
            return "INVALID_REQUEST", 405
        
        @app.route("/seller/sign-up", methods=['POST'])
        def sign_up():

            try:
                new_seller = request.json
                new_seller = seller_service.create_new_seller(new_seller)

                return new_seller

            except Exception:
                return InvalidUsage(status_code=400)
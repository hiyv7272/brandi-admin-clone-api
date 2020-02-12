from flask      import request, Response, jsonify, current_app, g, abort
from flask.json import JSONEncoder


class CustomJSONEncoder(JSONEncoder):
    def default(self, obj):
        if isinstance(obj, set):
            return list(obj)

        return JSONEncoder.default(self, obj)

class SellerView:

    def create_endpoints(app, services):

        app.json_encoder = CustomJSONEncoder
        seller_service  = services.seller_service

        @app.errorhandler(400)
        def bad_request(error):
            response = jsonify({'message': error.description})
            response.status_code = 400
            return response

        @app.errorhandler(404)
        def page_not_found(error):
            return "INVALID_URL", 404
        
        @app.errorhandler(405)
        def method_not_allowed(error):
            return "INVALID_REQUEST", 405
        
        @app.route("/seller/sign-up", methods=['POST'])
        def sign_up():

            new_seller = request.json
            new_seller = seller_service.create_new_seller(new_seller)

            return jsonify({'message':'SUCCESS'}, 200)
        
        """ 
        로그인 endpoint
        """
        @app.route("/login", methods=['POST'])
        def login():
            user_data = request.json
            user_info = seller_service.login_check(user_data)
            try:
                token = seller_service.generate_access_token(user_info)

                return jsonify({
                    'access_token' : token
                })
            except:
                return '', 401

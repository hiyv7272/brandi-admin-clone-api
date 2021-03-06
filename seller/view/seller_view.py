import jwt

from flask      import request, Response, jsonify, current_app, g, abort
from flask.json import JSONEncoder
from functools  import wraps


class CustomJSONEncoder(JSONEncoder):
    def default(self, obj):
        if isinstance(obj, set):
            return list(obj)

        return JSONEncoder.default(self, obj)

""" 
로그인 데코레이터
---------------
request : application/json, account 정보
---------------
return : http 응답코드(400, 401)
"""
def login_decorator(f):      
    @wraps(f)                   
    def decorated_function(*args, **kwargs):
        access_token = request.headers.get('Authorization') 
        if access_token is not None:  
            try:
                payload = jwt.decode(access_token, current_app.config['JWT_SECRET_KEY'], 'HS256')
            except jwt.InvalidTokenError:
                 payload = None     

            if payload is None: 
                return Response(status=401)   
            g.user_info = payload
        else:
            abort (401, description="INVALID_TOKEN") 

        return f(*args, **kwargs)
    return decorated_function

""" 
셀러 endpoints
"""
class SellerView:

    """ 
    셀러 endpoints 생성 메소드
    """
    def create_endpoints(app, services):

        app.json_encoder = CustomJSONEncoder
        seller_service  = services.seller_service

        """
        에러핸들러(400)
        """
        @app.errorhandler(400)
        def bad_request(error):
            response = jsonify({'message': error.description})
            response.status_code = 400
            return response

        """
        에러핸들러(404)
        """
        @app.errorhandler(404)
        def page_not_found(error):
            return "INVALID_URL", 404
        
        """
        에러핸들러(405)
        """
        @app.errorhandler(405)
        def method_not_allowed(error):
            return "INVALID_REQUEST", 405
        
        """
        셀러회원가입 엔드포인트
        -------------------
        request : application/json, account 정보
        -------------------
        return : http 응답코드 (200, 400, 401)
        """
        @app.route("/seller/sign-up", methods=['POST'])
        def sign_up():

            new_seller = request.json
            new_seller = seller_service.create_new_seller(new_seller)

            return jsonify({'message':'SUCCESS'}, 200)

        """
        회원로그인 엔드포인트
        -------------------
        request : application/json, account 정보
        -------------------
        return : http 응답코드 (200, 400, 401)
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

        """
        메뉴 엔드포인트
        -------------------
        request : JWT
        -------------------
        return : http 응답코드 (200, 400, 401), 권한에 따른 메뉴 정보
        """
        @app.route('/menu', methods=['GET'])
        @login_decorator
        def menu():       
            user_menu = seller_service.menu_service(g.user_info)
            return jsonify({
                'menu' : user_menu
            })

        """
        셀러정보에서 원본이미지를 등록하는 엔드포인트
        ----------
        request : 원본 이미지 ([('upload', <FileStorage: 'sample_image.jpg' ('image/jpeg')>)])
        -------
        return : http 응답코드, 파일 포맷이 jpg/jpeg 아니면 400 에러 리턴
        """        
        @app.route("/seller/image-upload", methods=['POST'])
        def seller_image_upload():
            req_json = request.files.to_dict(flat=False)
            if 'upload' not in req_json:
                abort(400, description="INVALID KEY")          

            image_file = req_json['upload']
            image_file_to_send = image_file[0]
            if not seller_service.allowed_image_file(image_file_to_send.filename):
                abort(400, description="FILE FORMAT NOT ALLOWD")

            # 이미지 처리 요청
            image_url = seller_service.upload_original_image(image_file_to_send)

            # 처리 결과 리턴
            if image_url:
                return jsonify(image_url)
            else:
                abort(404, description="URI NOT FOUND")

        """
        셀러정보 GET 엔드포인트
        -------------------
        request : JWT
        -------------------
        return : http 응답코드 (200, 400, 401), 셀러에 따른 셀러정보
        """
        @app.route("/seller/info-get", methods=['GET'])
        @login_decorator
        def seller_info_get():
            seller_info = seller_service.seller_info_check(g.user_info)

            return jsonify({
                'seller_info' : seller_info
            })

        """
        셀러정보 UPDATE 엔드포인트
        -------------------
        request : JWT, application/json, 셀러정보
        -------------------
        return : http 응답코드 (200, 400, 401)
        """
        @app.route("/seller/info-update", methods=['POST'])
        @login_decorator
        def seller_info_update():
            seller_request_data = request.json
            print('seller_request_data', seller_request_data)
            seller_info_update  = seller_service.update_seller_info(seller_request_data, g.user_info)

            return jsonify({'message':'SUCCESS'}, 200)

        """
        셀러 리스트 정보 SELECT 엔드포인트
        -------------------
        request : query string
        -------------------
        return : http 응답코드 (200, 400, 401)
        """
        @app.route("/seller/list", methods=['GET'])
        def seller_list():
            seller_list, seller_count     = seller_service.seller_list_get(request)

            return jsonify({
                'seller_info'   : seller_list,
                'seller_count'  : seller_count,
                'limit'         : request.args.get('limit'),
                'offset'        : request.args.get('offset'),
                'message'       :'SUCCESS',
            })

        """
        리스트 - 셀러정보 GET 엔드포인트
        -------------------
        request : query string
        -------------------
        return : http 응답코드 (200, 400, 401), 셀러에 따른 셀러정보
        """
        @app.route("/seller/list-info-get/<int:user_id>", methods=['GET'])
        def seller_info_detail_get(user_id):
            seller_info_detail = seller_service.seller_info_detail_check(user_id)

            return jsonify({
                'seller_info' : seller_info_detail
            })

        """
        리스트 - 셀러정보 update 엔드포인트
        -------------------
        request : query string, application/json, 셀러정보
        -------------------
        return : http 응답코드 (200, 400, 401), 셀러에 따른 셀러정보
        """
        @app.route("/seller/list-info-update/<int:user_id>", methods=['POST'])
        def seller_info_detail_update(user_id):
            seller_request_data = request.json
            seller_info_detail = seller_service.seller_info_detail_update(seller_request_data, user_id)

            return jsonify({'message':'SUCCESS'}, 200)


        """
         시연 초기 mocked 데이터 수정(account-bcyrpt)
        """
        @app.route("/password-bcrypt", methods=['GET'])
        def password_bcrypt():
            password_bcrypt = seller_service.account_password_bcyprt()

            return jsonify({'message':'SUCCESS'}, 200)
import os, io
from flask import Flask, request, jsonify, json, abort, Response
from PIL import Image

class ProductView:

    def create_endpoints(app, services):

        product_service  = services.product_service

        @app.errorhandler(400)
        def http_400_bad_request(error):
            response = jsonify({'message': error.description})
            response.status_code = 400
            return response

        @app.errorhandler(404)
        def http_404_not_found(error):
            response = jsonify({'message': error.description})
            response.status_code = 404
            return response

        """
        대표 이미지 등록시 리사이징 이미지를 등록하는 엔드포인트 
        ----------
        request : multipart/form-data, {image_file:<FileStorage: 'sample_image.jpg' ('image/jpeg')>}
        -------
        return : http 응답코드, 성공시 리사이징된 이미지 파일 3개 리턴, 파일 포맷이 jpg/jpeg 아니면 400 에러 리턴
        """
        @app.route("/product/image", methods=['POST'])
        def resize_upload_image():

            if 'image_file' not in request.files:
                abort(400, description="INVALID KEY")          

            image_file = request.files['image_file']

            if image_file.filename =='':
                abort(400, description="FILE EMPTY")
            
            if not product_service.allowed_image_file(image_file.filename):
                abort(400, description="FILE FORMAT NOT ALLOWD")

            image_url = product_service.resize_upload_image(image_file)

            if image_url:
                return jsonify(image_url)
            else:
                abort(404, description="URI NOT FOUND")

        """
        상품등록 게시판에서 원본이미지를 등록하는 엔드포인트
        ----------
        request : 원본 이미지 ImmutableMultiDict([('upload', <FileStorage: 'sample_image.jpg' ('image/jpeg')>)])
        -------
        return : http 응답코드, 파일 포맷이 jpg/jpeg 아니면 400 에러 리턴
        """
        @app.route("/product/original_image", methods=['POST'])
        def resize_upload_one_image():
            req_json = request.files.to_dict(flat=False)
            if 'upload' not in req_json:
                abort(400, description="INVALID KEY")          

            image_file = req_json['upload']
            image_file_to_send = image_file[0]
            if not product_service.allowed_image_file(image_file_to_send.filename):
                abort(400, description="FILE FORMAT NOT ALLOWD")

            # 이미지 처리 요청
            image_url = product_service.upload_original_image(image_file_to_send)

            # 처리 결과 리턴
            if image_url:
                return jsonify(image_url)
            else:
                abort(404, description="URI NOT FOUND")

        """
        상품을 데이터베이스에 등록하는 엔드포인트
        ----------
        request : application/json, 상품정보
        -------
        return : http 응답코드(200, 400)
        """
        @app.route("/product", methods=['POST'])
        def register_product():
            product_service.register_product(request)
            return Response(status=200)

        """
        상품코드로 상세정보 조회하는 엔드포인트
        ----------
        request : 상품코드 쿼리 스트링
        -------
        return : 상세 상품정보, http 응답코드, 쿼리 스트링으로 product_code가 오지 않으면 400에러 리턴
        """
        @app.route("/product_detail", methods=['GET'])
        def product_detail():
            print(request)
            product_code = request.args.get('product_code')
            if product_code is None:
                abort(400, description="NO QUERY STRING") 

            product=product_service.product_detail(product_code)
            return jsonify(product)

        """
        상품 리스트 페이지네이션 API
        ----------
        request : query string
        -------
        return : 상품리스트, http 응답코드(200, 400)
        """
        @app.route("/product_list", methods=['GET'])
        def product_pagination():
            # service call
            products_data = product_service.product_pagination(request)
            return jsonify(products_data)

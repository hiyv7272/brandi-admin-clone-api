import os, io
from flask import Flask, request, jsonify, json, abort
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

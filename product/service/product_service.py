import os
import io
import boto3
from PIL import Image
from uuid import uuid4
from werkzeug.utils import secure_filename
from flask import current_app
from smart_open import open

class ProductService:
    ALLOWED_EXTENSIONS = set(['jpg'])

    def __init__(self, product_dao):
        self.product_dao = product_dao

    # 리사이즈하는 파일의 확장자를 체크하는 함수
    def allowed_image_file(self, filename):
        return '.' in filename and \
            filename.rsplit('.', 1)[1].lower() in self.ALLOWED_EXTENSIONS 

    # 리사이즈하는 크기와 파일에 추가되는 문자열을 튜플로 리턴하는 함수
    def image_width_size(self, img_size):
        resizer={
            'small': (150, '_S'),
            'medium': (320, '_M'),
            'large': (640, '_L')
        }
        return resizer.get(img_size,"Invalid size")

    # 이미지를 S3에 업로드 하는 함수
    def upload_image(self, upload_image, upload_filename):
        access_key = current_app.config['S3_ACCESS_KEY']
        secret_key = current_app.config['S3_SECRET_KEY']
        bucket = current_app.config['S3_BUCKET']
        bucket_url = current_app.config['S3_BUCKET_URL']
        obj_url = f's3://{access_key}:{secret_key}@{bucket}/{upload_filename}'

        with open(obj_url ,'wb') as fout:
            fout.write(upload_image.getvalue())
            uploaded_url = f'{bucket_url}{upload_filename}'

        return uploaded_url

    # 이미지를 리사이즈하고 S3에 업로드 하는 함수
    def resize_upload_image(self, image_file):

        filename, file_extension = os.path.splitext(image_file.filename)
        image_size_list = ['small','medium','large']
        
        # 3가지 종류로 이미지를 리사이즈하고 S3에 업로드한 url을 딕셔너리로 저장
        img_urls = dict()
        for img_size in image_size_list:
            resize_width, separator = self.image_width_size(img_size)
            with Image.open(image_file) as opened_image:
                # 리사이즈 하는 비율을 계산하여 리사이즈된 이미지를 ByteIO로 버퍼에 저장하여 전송
                img_io = io.BytesIO()
                img_width = resize_width
                width_percent = (img_width/float(opened_image.size[0]))
                img_height = int((float(opened_image.size[1])*float(width_percent)))
                resized_image = opened_image.resize( (img_width,img_height), Image.ANTIALIAS)
                resized_image.save(img_io, 'jpeg')
                img_io.seek(0)

                # 사이즈별로 다른 파일명으로 smart open을 사용하여 S3로 업로드
                uploaded_name = str(uuid4()) + filename + separator + file_extension
                uploaded_url=self.upload_image(img_io, uploaded_name)
                img_urls[img_size] = uploaded_url

        return img_urls

    # 원본 이미지를 S3에 업로드 하는 함수
    def upload_original_image(self, image_file):

        filename, file_extension = os.path.splitext(image_file.filename)
        
        # 원본 이미지를 S3에 업로드하고 URL을 리턴
        img_urls = dict()
        with Image.open(image_file) as opened_image:
            img_io = io.BytesIO()
            opened_image.save(img_io, 'jpeg')
            img_io.seek(0)

            uploaded_name = str(uuid4()) + filename + file_extension
            uploaded_url=self.upload_image(img_io, uploaded_name)
            img_urls['uploaded'] = 1
            img_urls['fileName'] = uploaded_name
            img_urls['url'] = uploaded_url

        return img_urls

    def register_product(self, request):
        self.product_dao.register_product_dao(request)

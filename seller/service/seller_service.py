import bcrypt
import jwt
import re
import os
import io
import boto3

from PIL                import Image
from uuid               import uuid4
from werkzeug.utils     import secure_filename
from flask              import request, jsonify, current_app, g, abort
from flask.json         import JSONEncoder
from datetime           import datetime, timedelta
from smart_open import open


class SellerService():
    ALLOWED_EXTENSIONS = set(['jpg'])
    
    def __init__(self, seller_dao):
        self.seller_dao = seller_dao

    """
    유효성 검사 메소드
    """
    def validate(self, data):
        check_account   = re.compile("^[A-Za-z0-9]+[A-Za-z0-9-_]{4,20}$")
        check_password  = re.compile("^[A-Za-z0-9~`!@#$%\^&*()-+=]{4,}$")
        check_number    = re.compile("^[0-9]{10,11}$")
        check_name_kr   = re.compile("^[ㄱ-ㅣ가-힣-0-9A-Za-z]([0-9ㄱ-ㅣ가-힣A-Za-z]){1,20}$")
        check_name_en   = re.compile("[a-z0-9]{1,20}$")
        check_site_url  = re.compile("^(https?)\:\/\/+[A-Za-z0-9-_.]{1,}$")

        if data['account']:
            if not check_account.match(data['account']):
                abort (400, description="INVALID_ACCOUNT")
        
        if data['password']:
            if not check_password.match(data['password']):
                abort (400, description="INVALID_PASSWORD")
        
        if 'cs_phone_number' in data:
            if not check_number.match(data['cs_phone_number']):
                abort (400, description="INVALID_PHONE_NUMBER")
        
        if 'mobile_number' in data:
            if not check_number.match(data['mobile_number']):
                abort (400, description="INVALID_MOBILE_NUMBER")

        if 'name_kr' in data:
            if not check_name_kr.match(data['name_kr']):
                abort (400, description="INVALID_NAME_KR")

        if 'name_en' in data:
            if not check_name_kr.match(data['name_en']):
                abort (400, description="INVALID_NAME_EN")                

        if 'site_url' in data:
            if not check_site_url.match(data['site_url']):
                abort (400, description="INVALID_SITE_URL")
        
        return None    

    """
    계정생성 메소드
    """
    def create_new_seller(self, new_seller):
        try:
            validation              = self.validate(new_seller) 
            new_seller['password']  = bcrypt.hashpw(  
                new_seller['password'].encode('UTF-8'),
                bcrypt.gensalt()
            )

            insert_new_seller = self.seller_dao.insert_seller(new_seller)
            
            return insert_new_seller
        
        except KeyError:
            abort (400, description="INVALID_KEY")

    """
    로그인_체크 메소드
    """
    def login_check(self, user_data):
        try:
            validation      = self.validate(user_data)
            password        = user_data['password']
            user_info       = self.seller_dao.get_user_info(user_data)

            if bcrypt.checkpw(password.encode('UTF-8'), user_info['password'].encode('UTF-8')):
                return user_info

        except KeyError:
            abort (400, description="INVALID_KEY")
        except:
            abort (400, description="INVALID_USER")
            
    """
    access_token(JWT) 생성 메소드
    """
    def generate_access_token(self, user_info):
        payload = {     
            'accounts_id'    : user_info['id'],
            'authorities_id' : user_info['authorities_id'],
            'exp'            : datetime.utcnow() + timedelta(seconds = 60 * 60 * 24)
        }
        token = jwt.encode(payload, current_app.config['JWT_SECRET_KEY'], 'HS256')

        return token.decode('UTF-8')

    """
    권한에 따른 메뉴 확인 메소드
    """
    def menu_service(self, user_info):
        user_authorities_id = user_info['authorities_id']
        
        if user_authorities_id == 1:
            master_menu = self.seller_dao.master_auth_group_menu(user_info)
            return master_menu

        if user_authorities_id == 2:
            seller_menu = self.seller_dao.seller_auth_group_menu(user_info)
            return seller_menu

        if user_authorities_id > 2:
            abort (400, description="INVALID_KEY")

    """
    리사이즈하는 파일의 확장자를 체크하는 함수
    """
    def allowed_image_file(self, filename):
        return '.' in filename and \
            filename.rsplit('.', 1)[1].lower() in self.ALLOWED_EXTENSIONS

    """
    이미지를 S3에 업로드 하는 함수
    """
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

    """
    원본 이미지를 S3에 업로드 하는 함수
    """
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
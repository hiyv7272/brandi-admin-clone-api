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

        if 'account' in data:
            if not check_account.match(data['account']):
                abort (400, description="INVALID_ACCOUNT")

        if 'password' in data:
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
            else:
                abort (400, description="INVALID_USER")

        except KeyError:
            abort (400, description="INVALID_KEY")
            
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

    """
    셀러정보를 확인하는 메소드
    """
    def seller_info_check(self, seller_info):
        
        seller_info  = self.seller_dao.get_seller_info(seller_info)
            
        return seller_info

    """
    셀러정보를 업데이트하는 메소드
    """
    def update_seller_info(self, seller_request_data, user_info):
        try:
            seller_data = {
                'accounts_id'       : user_info['accounts_id'],
                'name_kr'           : seller_request_data['seller_info']['name_kr'],
                'name_en'           : seller_request_data['seller_info']['name_en'],
                'cs_phone_number'   : seller_request_data['seller_info']['cs_phone_number'],
                'site_url'          : seller_request_data['seller_info']['site_url'],
                'instagram_account' : seller_request_data['seller_info']['instagram_account'],
                'cs_kakao_account'  : seller_request_data['seller_info']['cs_kakao_account']
            }

            seller_info_data = {
                'accounts_id'           : user_info['accounts_id'],
                'profile_image'         : seller_request_data['seller_info']['profile_image'],
                'ceo_name'              : seller_request_data['seller_info']['ceo_name'],
                'company_name'          : seller_request_data['seller_info']['company_name'],
                'company_code'          : seller_request_data['seller_info']['company_code'],
                'company_certi_image'   : seller_request_data['seller_info']['company_certi_image'],
                'mail_order_code'       : seller_request_data['seller_info']['mail_order_code'],
                'mail_order_image'      : seller_request_data['seller_info']['mail_order_image'],
                'bg_image'              : seller_request_data['seller_info']['bg_image'],
                'single_line_intro'     : seller_request_data['seller_info']['single_line_intro'],
                'detailed_intro'        : seller_request_data['seller_info']['detailed_intro'],
                'shopping_info'         : seller_request_data['seller_info']['shopping_info'],
                'refund_info'           : seller_request_data['seller_info']['refund_info']
            }
            
            seller_representative_data = seller_request_data['seller_info']['seller_representative']

            for i in range(len(seller_representative_data)):
                seller_representative_data[i]['accounts_id'] = user_info['accounts_id']

            validation          = self.validate(seller_data)
            validation          = self.validate(seller_info_data)

            # for i in range(len(seller_representative_data)):
            #     validation          = self.validate(seller_representative_data[i])
                
            update_seller_info              = self.seller_dao.update_seller_info(seller_data, seller_info_data)
            update_seller_representative    = self.seller_dao.update_seller_representative(seller_representative_data)
 
            return update_seller_info
        
        except KeyError:
            abort (400, description="INVALID_KEY")

    
    def seller_list_get(self, request):

        request_param = {}
        if request.args.get('limit'):
            request_param['limit'] = int(request.args.get('limit'))
        else:
            request_param['limit'] = 10
        
        if request.args.get('offset'):
            request_param['offset'] = int(request.args.get('offset'))
        else:
            request_param['offset'] = 0

        if request.args.get('start_date'):
            request_param['start_date'] = request.args.get('start_date')
        
        if request.args.get('end_date'):
            request_param['end_date'] = request.args.get('end_date')
        
        if request.args.get('account'):
            request_param['account'] = request.args.get('account')

        if request.args.get('name_kr'):
            request_param['name_kr'] = request.args.get('name_kr')

        if request.args.get('name_en'):
            request_param['name_en'] = request.args.get('name_en')

        if request.args.get('site_url'):
            request_param['site_url'] = request.args.get('site_url')
        
        if request.args.get('representative_name'):
            request_param['representative_name'] = request.args.get('representative_name')
        
        if request.args.get('mobile_number'):
            request_param['mobile_number'] = request.args.get('mobile_number')

        if request.args.get('email'):
            request_param['email'] = request.args.get('email')
        
    
        seller_list_get = self.seller_dao.search_seller_list(request_param)

        return seller_list_get

    def serller_list_count(self):

        seller_count_get = self.seller_dao.search_seller_count()

        return seller_count_get
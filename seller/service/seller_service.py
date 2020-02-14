import bcrypt
import jwt
import re

from flask      import request, jsonify, current_app, g, abort
from flask.json import JSONEncoder

from datetime   import datetime, timedelta


class SellerService():
    
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
            validation      = self.validate(new_seller) 
            new_seller['password'] = bcrypt.hashpw(  
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
        print(user_info)
        payload = {     
            'accounts_id'    : user_info['id'],
            'authorities_id' : user_info['authorities_id'],
            'exp'            : datetime.utcnow() + timedelta(seconds = 60 * 60 * 24)
        }
        token = jwt.encode(payload, current_app.config['JWT_SECRET_KEY'], 'HS256')
        
        return token.decode('UTF-8')
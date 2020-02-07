import bcrypt
import re

from flask      import request, jsonify
from flask.json import JSONEncoder


class SellerService():
    
    def __init__(self, seller_dao):
        self.seller_dao = seller_dao
    
    def create_new_seller(self, new_seller):
        check_account = re.compile("^[A-Za-z0-9]+[A-Za-z0-9-_]{5,20}$")
        check_password = re.compile("^[A-Za-z0-9~`!@#$%\^&*()-+=]{4,}$")
        check_number = re.compile("^[0-9]{10,11}$")

        if not check_account.match(new_seller['account']):

            return 'INVALID_ACCOUNT', 400
        
        if not check_password.match(new_seller['password']):
            return 'INVALID_PASSWORD', 400

        if not check_number.match(new_seller['cs_phone_number']):
            return 'INVALID_PHONE_NUMBER', 400
        
        if not check_number.match(new_seller['mobile_number']):
            return 'INVALID_MOBILE_NUMBER', 400

        new_seller['password'] = bcrypt.hashpw(  
            new_seller['password'].encode('UTF-8'),
            bcrypt.gensalt()
        )

        insert_new_seller = self.seller_dao.insert_seller(new_seller)
        
        return insert_new_seller
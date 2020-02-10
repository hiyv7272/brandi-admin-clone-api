import bcrypt
import re

from flask      import request, jsonify, abort
from flask.json import JSONEncoder


class SellerService():
    
    def __init__(self, seller_dao):
        self.seller_dao = seller_dao
    
    def create_new_seller(self, new_seller):

        try:

            check_account = re.compile("^[A-Za-z0-9]+[A-Za-z0-9-_]{5,20}$")
            check_password = re.compile("^[A-Za-z0-9~`!@#$%\^&*()-+=]{4,}$")
            check_number = re.compile("^[0-9]{10,11}$")

            if not check_account.match(new_seller['account']):
                abort (400, description="INVALID_ACCOUNT")
            
            if not check_password.match(new_seller['password']):
                abort (400, description="INVALID_PASSWORD")

            if not check_number.match(new_seller['cs_phone_number']):
                abort (400, description="INVALID_PHONE_NUMBER")
            
            if not check_number.match(new_seller['mobile_number']):
                abort (400, description="INVALID_MOBILE_NUMBER")

            new_seller['password'] = bcrypt.hashpw(  
                new_seller['password'].encode('UTF-8'),
                bcrypt.gensalt()
            )

            insert_new_seller = self.seller_dao.insert_seller(new_seller)
            
            return insert_new_seller
        
        except KeyError:
            abort (400, description="INVALID_KEY")

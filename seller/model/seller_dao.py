import mysql.connector

from mysql.connector.errors import Error
from mysql.connector.cursor import MySQLCursor
from flask                  import abort

class SellerDao:

    def __init__(self, database):
        self.db = database

    """
    계정생성 INSERT INTO 메소드
    """
    def insert_seller(self, new_seller):
        db_cursor = self.db().cursor()
      
        try:
            new_seller_data = {
                'seller_types_id'       : new_seller['seller_types_id'],
                'account'               : new_seller['account'],
                'name_kr'               : new_seller['name_kr'],
                'name_en'               : new_seller['name_en'],
                'password'              : new_seller['password'],
                'mobile_number'         : new_seller['mobile_number'],
                'cs_phone_number'       : new_seller['cs_phone_number'],
                'site_url'              : new_seller['site_url'],
                'instagram_account'     : new_seller['instagram_account'],
                'cs_kakao_account'      : new_seller['cs_kakao_account'],
            }

            query_start = ("START TRANSACTION")
            db_cursor.execute(query_start)

            quert_autocommit_0 = ("SET AUTOCOMMIT=0")
            db_cursor.execute(quert_autocommit_0)

            insert_accounts = ("""
                INSERT INTO accounts (
                    authorities_id,
                    account,
                    password
                ) VALUES(
                    (SELECT id FROM authorities WHERE id = 2),
                    %(account)s,
                    %(password)s
                )
            """)
            db_cursor.execute(insert_accounts, new_seller_data)

            insert_sellers = ("""
                INSERT INTO sellers (
                    accounts_id,
                    auth_groups_id,
                    seller_status_id,
                    seller_types_id,
                    account,
                    name_kr,
                    name_en,
                    password,
                    mobile_number,
                    cs_phone_number,
                    site_url,
                    instagram_account,
                    cs_kakao_account,
                    is_used
                ) VALUES (
                    (SELECT id FROM accounts WHERE account = %(account)s limit 1),
                    (SELECT id FROM auth_groups WHERE id = 1),
                    (SELECT id FROM seller_status WHERE id = 1),
                    (SELECT id FROM seller_types WHERE id = %(seller_types_id)s limit 1),
                    %(account)s,
                    %(name_kr)s,
                    %(name_en)s, 
                    %(password)s,
                    %(mobile_number)s,
                    %(cs_phone_number)s,
                    %(site_url)s,
                    %(instagram_account)s,
                    %(cs_kakao_account)s,
                    TRUE
                )
            """)

            db_cursor.execute(insert_sellers, new_seller_data)
            self.db().commit()
            db_cursor.close()
        
        except KeyError:
            abort(400, description="INVAILD_KEY")

        except mysql.connector.Error as err:
            query_rollback = ("ROLLBACK")
            db_cursor.execute(query_rollback)
            db_cursor.close()
            abort(400, description="INVAILD_DATA")

    """
    유저정보 SELECT 메소드
    """
    def get_user_info(self, user_data):
        db_cursor = self.db().cursor()
        
        try:
            user_data = {
                'account'  : user_data['account'],
                'password' : user_data['password'],
            }
                
            query_search = ("""
                SELECT
                    id,
                    authorities_id,
                    account,
                    password
                FROM accounts
                WHERE account = %(account)s limit 1
            """)

            db_cursor.execute(query_search, user_data)

            for row in db_cursor:
                user_info = {
                    'id' : row[0],
                    'authorities_id' : row[1],
                    'account' : row[2],
                    'password' : row[3]
                }
                return user_info
                       
            db_cursor.close()

        except KeyError:
            abort(400, description="INVAILD_KEY")

        except mysql.connector.Error as err:
            abort(400, description="INVAILD_DATA")

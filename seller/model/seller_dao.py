import mysql.connector

from flask      import abort

class SellerDao:

    def __init__(self, database):
        self.db = database

    def insert_seller(self, new_seller):
        db_cursor = self.db().cursor()
      
        try:
            new_seller_data = {
                'seller_types_id' : new_seller['seller_types_id'],
                'account'  : new_seller['account'],
                'name_kr'  : new_seller['name_kr'],
                'name_en'  : new_seller['name_en'],
                'password' : new_seller['password'],
                'mobile_number' : new_seller['mobile_number'],
                'cs_phone_number' : new_seller['cs_phone_number'],
                'site_url' : new_seller['site_url'],
                'instagram_account' : new_seller['instagram_account'],
                'cs_kakao_account' : new_seller['cs_kakao_account'],
            }

            query_start = ("START TRANSACTION")
            db_cursor.execute(query_start)

            quert_autocommit_0 = ("SET AUTOCOMMIT=0")
            db_cursor.execute(quert_autocommit_0)

            query_1 = ("""
                INSERT INTO accounts (
                    authorities_id,
                    account,
                    password
                ) VALUES(
                    (SELECT id FROM authorities WHERE name='셀러' limit 1),
                    %(account)s,
                    %(password)s
                )
            """)
            db_cursor.execute(query_1, new_seller_data)

            query_2 = ("""
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
                    (SELECT id FROM accounts WHERE account=%(account)s limit 1),
                    (SELECT id FROM auth_groups WHERE name='셀러 입점' limit 1),
                    (SELECT id from seller_status WHERE name='입점대기' limit 1),
                    (SELECT id FROM seller_types WHERE id=%(seller_types_id)s limit 1),
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

            db_cursor.execute(query_2, new_seller_data)
            self.db().commit()
            db_cursor.close()

        except mysql.connector.Error as err:
            query_rollback = ("ROLLBACK")
            db_cursor.execute(query_rollback)
            db_cursor.close()
            abort(400, description="INVAILD_DATA")
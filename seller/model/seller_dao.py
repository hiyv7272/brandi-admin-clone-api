import mysql.connector

from mysql.connector.errors import Error
from mysql.connector.cursor import MySQLCursor
from flask                  import abort

class SellerDao:

    def __init__(self, database):
        self.db_connection = database.get_connection()

    """
    계정생성 INSERT INTO 메소드
    """
    def insert_seller(self, new_seller):
        db_cursor = self.db_connection.cursor()
      
        try:
            # POST 받은 account 정보
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

            # 트랜잭션 시작 
            query_start = ("START TRANSACTION")
            db_cursor.execute(query_start)

            # 자동 커밋 비활성화
            quert_autocommit_0 = ("SET AUTOCOMMIT=0")
            db_cursor.execute(quert_autocommit_0)

            # accounts 테이블 INSERT INTO문
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
            
            # sellers_info 테이블 INSERT INTO문
            insert_selles_info = ("""
                INSERT INTO sellers_info (
                    accounts_id
                ) VALUES (
                    (SELECT id FROM accounts WHERE account = %(account)s limit 1)
                )
            """)
            db_cursor.execute(insert_selles_info, new_seller_data)

            # sellers 테이블 INSERT INTO문
            insert_sellers = ("""
                INSERT INTO sellers (
                    accounts_id,
                    auth_groups_id,
                    seller_status_id,
                    seller_types_id,
                    seller_info_id,
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
                    (SELECT id FROM auth_groups WHERE id = 2),
                    (SELECT id FROM seller_status WHERE id = 1),
                    (SELECT id FROM seller_types WHERE id = %(seller_types_id)s limit 1),
                    (SELECT id FROM sellers_info WHERE accounts_id = 
                    (SELECT id FROM accounts WHERE account = %(account)s limit 1) limit 1),
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

            # seller_representative 테이블 INSERT INTO문
            insert_seller_representative = ("""
                INSERT INTO seller_representative (
                    sellers_id,
                    mobile_number,
                    is_used
                ) VALUES (
                    (SELECT id FROM sellers WHERE account = %(account)s limit 1),
                    %(mobile_number)s,
                    TRUE
                )
            """)
            db_cursor.execute(insert_seller_representative, new_seller_data)
            
            self.db_connection.commit()
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
        db_cursor = self.db_connection.cursor()
        
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

    """
    마스터 권한_그룹_메뉴 정보 SELECT 메소드
    """
    def master_auth_group_menu(self, master_info):
        db_cursor = self.db_connection.cursor()
        try:
            master_menu = []

            master_data = {
                'accounts_id' : master_info['accounts_id']
            }

            # 마스터의 권한_그룹_id SELECT문
            search_auth_group_id = ("""
                SELECT
                auth_groups_id 
                FROM masters
                WHERE accounts_id =%(accounts_id)s
            """)
            db_cursor.execute(search_auth_group_id, master_data)
            
            search_result = db_cursor.fetchone()
            master_data['auth_groups_id'] = search_result[0]

            # 권한_그룹_메뉴 확인 SELECT문
            search_auth_group_menu = ("""
                SELECT 
                b.id,
                b.topmenu_id,
                b.topmenu,
                b.name,
                b.url,
                b.depth
                FROM auth_groups_menu AS a 
                INNER JOIN menu AS b 
                ON a.menu_id = b.id 
                WHERE auth_groups_id = %(auth_groups_id)s
            """)
            db_cursor.execute(search_auth_group_menu, master_data)

            data = db_cursor.fetchall()

            # 상위 메뉴 정렬
            for el in data:
                if el[5] == 0:
                    master_topmenu = {
                    'id'            : el[0],
                    'topmenu_id'    : el[1],
                    'topmenu'       : el[2],
                    'name'          : el[3],
                    'url'           : el[4],
                    'list'          : []
                    }
                    master_menu.append(master_topmenu)

            # 하위 메뉴 정렬
            for el in data:
                if el[5] == 1:
                    master_bottom_menu = {
                        'id'            : el[0],
                        'topmenu_id'    : el[1],
                        'topmenu'       : el[2],
                        'name'          : el[3],
                        'url'           : el[4]
                    }
                    for i in range(len(master_menu)):
                        if master_menu[i]['id'] == el[1]:
                            master_menu[i]['list'].append(master_bottom_menu)

            return master_menu
            db_cursor.close()
        
        except KeyError:
            abort(400, description="INVAILD_KEY")

        except mysql.connector.Error as err:
            abort(400, description="INVAILD_DATA")

    """
    셀러 권한_그룹_메뉴 정보 SELECT 메소드
    """
    def seller_auth_group_menu(self, seller_info):
        db_cursor = self.db_connection.cursor()
        try:
            seller_menu = []

            seller_data = {
                'accounts_id' : seller_info['accounts_id']
            }

            # 셀러의 권한_그룹_id SELECT문
            search_auth_group_id = ("""
                SELECT
                auth_groups_id 
                FROM sellers
                WHERE accounts_id =%(accounts_id)s
            """)
            db_cursor.execute(search_auth_group_id, seller_data)
            
            search_result = db_cursor.fetchone()
            seller_data['auth_groups_id'] = search_result[0]
            
            # 권한_그룹_메뉴 확인 SELECT문
            search_auth_group_menu = ("""
                SELECT 
                b.id,
                b.topmenu_id,
                b.topmenu,
                b.name,
                b.url,
                b.depth
                FROM auth_groups_menu AS a 
                INNER JOIN menu AS b 
                ON a.menu_id = b.id 
                WHERE auth_groups_id = %(auth_groups_id)s
            """)
            db_cursor.execute(search_auth_group_menu, seller_data)
            
            data = db_cursor.fetchall()

            # 상위 메뉴 정렬
            for el in data:
                if el[5] == 0:
                    seller_topmenu = {
                    'id'            : el[0],
                    'topmenu_id'    : el[1],
                    'topmenu'       : el[2],
                    'name'          : el[3],
                    'url'           : el[4],
                    'list'          : []
                    }
                    seller_menu.append(seller_topmenu)

            # 하위 메뉴 정렬
            for el in data:
                if el[5] == 1:
                    seller_bottom_menu = {
                        'id'            : el[0],
                        'topmenu_id'    : el[1],
                        'topmenu'       : el[2],
                        'name'          : el[3],
                        'url'           : el[4]
                    }
                    for i in range(len(seller_menu)):
                        if seller_menu[i]['id'] == el[1]:
                            seller_menu[i]['list'].append(seller_bottom_menu)

            return seller_menu
            db_cursor.close()
        
        except KeyError:
            abort(400, description="INVAILD_KEY")

        except mysql.connector.Error as err:
            abort(400, description="INVAILD_DATA")
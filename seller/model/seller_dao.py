import mysql.connector
import traceback

from datetime import datetime
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
                ) VALUES 
                (
                    (SELECT id FROM sellers WHERE account = %(account)s limit 1),
                    %(mobile_number)s,
                    TRUE
                ),
                (
                    (SELECT id FROM sellers WHERE account = %(account)s limit 1),
                    null,
                    TRUE
                ),
                (
                    (SELECT id FROM sellers WHERE account = %(account)s limit 1),
                    null,
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
            self.db_connection.commit()
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
            self.db_connection.commit()
            db_cursor.close()
        
        except KeyError:
            abort(400, description="INVAILD_KEY")

        except mysql.connector.Error as err:
            abort(400, description="INVAILD_DATA")


    """
    셀러 정보 SELECT 메소드
    """
    def get_seller_info(self, seller_info):
        db_cursor = self.db_connection.cursor()
        
        try:
            seller_data = {
                'accounts_id'    : seller_info['accounts_id'],
                'authorities_id' : seller_info['authorities_id'],
            }

             # 셀러 정보 SELECT 문
            query_get_seller_info = ("""
                SELECT
                    a.accounts_id,
                    a.account,
                    a.seller_types_id,
                    a.name_kr,
                    a.name_en,
                    a.cs_phone_number,
                    a.site_url,
                    a.instagram_account,
                    a.cs_kakao_account,
                    a.cs_yellow_account,
                    b.profile_image,
                    b.ceo_name,
                    b.company_name,
                    b.company_code,
                    b.company_certi_image,
                    b.mail_order_code,
                    b.mail_order_image,
                    b.bg_image,
                    b.single_line_intro,
                    b.detailed_intro,
                    b.shopping_info,
                    b.refund_info
                FROM sellers AS a
                INNER JOIN sellers_info AS b
                ON a.seller_info_id = b.id
                WHERE a.accounts_id = %(accounts_id)s limit 1
            """)
            db_cursor.execute(query_get_seller_info, seller_data)

            for row in db_cursor:
                seller_info = {
                    'accounts_id' : row[0],
                    'accounts'    : row[1],
                    'seller_types_id' : row[2],
                    'name_kr' : row[3],
                    'name_en' : row[4],
                    'cs_phone_number' : row[5],
                    'site_url' : row[6],
                    'instagram_account' : row[7],
                    'cs_kakao_account'  : row[8],
                    'cs_yellow_account' : row[9],
                    'profile_image' : row[10],
                    'ceo_name' : row[11],
                    'company_name' : row[12],
                    'company_code' : row[13],
                    'company_certi_image' : row[14],
                    'mail_order_code' : row[15],
                    'mail_order_image' : row[16],
                    'bg_image' : row[17],
                    'single_line_intro' : row[18],
                    'detailed_intro' : row[19],
                    'shopping_info' : row[20],
                    'refund_info' : row[21],
                    'seller_representative' : []
                }
            
             # 셀러 담당자 SELECT 문
            query_get_seller_representative = ("""
                SELECT
                id,
                sellers_id,
                name,
                mobile_number,
                email,
                is_used
                FROM seller_representative
                WHERE 
                sellers_id = (SELECT id FROM sellers WHERE accounts_id = %(accounts_id)s)
                AND
                is_used = TRUE limit 3
            """)
            db_cursor.execute(query_get_seller_representative, seller_data)
            seller_representative_data = db_cursor.fetchall()

            for i in range(len(seller_representative_data)):
                seller_representative = {
                    'id' : seller_representative_data[i][0],
                    'sellers_id' : seller_representative_data[i][1],
                    'name' : seller_representative_data[i][2],
                    'mobile_number' : seller_representative_data[i][3],
                    'email' : seller_representative_data[i][4],
                    'is_used' : seller_representative_data[i][5]
                }
                seller_info['seller_representative'].append(seller_representative)
            return seller_info

            db_cursor.close()

        except KeyError:
            abort(400, description="INVAILD_KEY")

        except mysql.connector.Error as err:
            abort(400, description="INVAILD_DATA")


    """
    셀러 정보 UPDATE 메소드
    """
    def update_seller_info(self, seller_data, seller_info_data):
        db_cursor = self.db_connection.cursor()
        print()

        try:
            # 트랜잭션 시작
            query_start = ("START TRANSACTION")
            db_cursor.execute(query_start)

            # 자동 커밋 비활성화
            quert_autocommit_0 = ("SET AUTOCOMMIT=0")
            db_cursor.execute(quert_autocommit_0)

            # 셀러 테이블 업데이트
            update_sellers = ("""
                UPDATE
                sellers
                SET
                name_kr = %(name_kr)s,
                name_en = %(name_en)s,
                cs_phone_number = %(cs_phone_number)s,
                site_url = %(site_url)s,
                instagram_account = %(instagram_account)s,
                cs_kakao_account = %(cs_kakao_account)s,
                cs_yellow_account = %(cs_yellow_account)s
                WHERE accounts_id = %(accounts_id)s
            """)
            db_cursor.execute(update_sellers, seller_data)

            # 셀러 정보 테이블 업데이트
            update_sellers_info = ("""
                UPDATE
                sellers_info
                SET
                profile_image = %(profile_image)s,
                ceo_name = %(ceo_name)s,
                company_name = %(company_name)s,
                company_code = %(company_code)s,
                company_certi_image = %(company_certi_image)s,
                mail_order_code = %(mail_order_code)s,
                mail_order_image = %(mail_order_image)s,
                bg_image = %(bg_image)s,
                single_line_intro = %(single_line_intro)s,
                detailed_intro = %(detailed_intro)s,
                shopping_info = %(shopping_info)s,
                refund_info = %(refund_info)s
                WHERE accounts_id = %(accounts_id)s
            """)
            db_cursor.execute(update_sellers_info, seller_info_data)

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
    셀러 담당자 UPDATE 메소드
    """
    def update_seller_representative(self, seller_representative_data):
        print('seller_representative_data @dao', seller_representative_data)
        db_cursor = self.db_connection.cursor()
        try:
            # 셀러 담당자 테이블 SELECT
            search_seller_representative = ("""
                SELECT
                id
                FROM seller_representative
                WHERE id = %(id)s
            """)

            # 셀러 담당자 테이블 UPDATE
            update_seller_representative = ("""
                UPDATE
                seller_representative
                SET
                sellers_id = (SELECT id FROM sellers WHERE accounts_id = %(accounts_id)s),
                name = %(name)s,
                mobile_number = %(mobile_number)s,
                email = %(email)s
                WHERE id = %(id)s
            """)


            # 셀러 담당자 테이블에 id를 찾아서 UPDATE
            for i in range(len(seller_representative_data)):
                db_cursor.execute(search_seller_representative, seller_representative_data[i])
                seller_id = db_cursor.fetchone()[0]
                if seller_id == seller_representative_data[i]['id']:
                    db_cursor.execute(update_seller_representative, seller_representative_data[i])
                        
                
            self.db_connection.commit() 
            db_cursor.close()
        
        except KeyError:
            abort(400, description="INVAILD_KEY")

        except mysql.connector.Error as err:
            abort(400, description="INVAILD_DATA")

    """
    셀러 리스트 SEARCH 메소드
    """    
    def search_seller_list(self, request_param):
        try:
            db_cursor = self.db_connection.cursor(buffered=True, dictionary=True)
            seller_list = []

            # 셀러 정보를 찾는 기본 SELECT문
            select_seller_info = ("""
                SELECT
                a.id,
                a.account,
                a.name_kr,
                a.name_en,
                a.site_url,
                a.seller_status_id,
                a.seller_types_id,
                a.created_at,
                ANY_VALUE(b.name),
                ANY_VALUE(b.mobile_number),
                ANY_VALUE(b.email)
                FROM sellers AS a
                LEFT JOIN seller_representative AS b
                ON a.id = b.sellers_id
                WHERE 1=1
            """)

            select_seller_count = ("""
                SELECT
                COUNT(0) cnt
                FROM sellers AS a
                LEFT JOIN seller_representative AS b
                ON a.id = b.sellers_id
                WHERE 1=1
            """)

            # 셀러의 상품 카운트정보 SELECT COUNT문
            count_seller_product = ("""
                SELECT 
                COUNT(creator_id)
                FROM products
                WHERE creator_id = %(id)s
            """)

            # query로 받는 파라미터 중 다음 항목이 있으면 해당하는 WHERE 조건을 추가
            # start_date와 end_date가 있으면, 날짜시간 포맷 후 WHERE 조건 추가
            seller_info_filter = ""

            if request_param['start_date'] and request_param['end_date']:
                start_date          = '"'+str(request_param['start_date']) + " 00:00:00"+'"'
                end_date            = '"'+str(request_param['end_date']) + " 23:59:59"+'"'
                seller_info_filter += f' AND a.created_at BETWEEN {start_date} AND {end_date}'  

            #  id가 있으면, id WHERE 조건 추가
            if 'id' in request_param:
                id = "'" + str(request_param['id']) + "'"
                seller_info_filter += f' AND a.id = {id}'
            else:None
            
            # account가 있으면, account WHERE like 조건 추가
            if 'account' in request_param:
                account = "'%" + str(request_param['account']) + "%'"
                seller_info_filter += f' AND a.account like {account}'
            else:None
            
            # name_kr가 있으면, name_kr가 WHERE like 조건 추가
            if 'name_kr' in request_param:
                name_kr = "'%" + str(request_param['name_kr']) + "%'"
                seller_info_filter += f' AND a.name_kr like {name_kr}'
            else:None
            
            # name_en가 있으면, name_en가 WHERE like 조건 추가
            if 'name_en' in request_param:
                name_en = "'%" + str(request_param['name_en']) + "%'"
                seller_info_filter += f' AND a.name_en like {name_en}'
            else:None

            # site_url 있으면, site_url WHERE like 조건 추가
            if 'site_url' in request_param:
                site_url = "'%" + str(request_param['site_url']) + "%'"
                seller_info_filter += f' AND a.site_url like {site_url}'
            else:None

            # seller_types_id 있으면, seller_types_id WHERE 조건 추가
            if 'seller_types_id' in request_param:
                seller_types_id = "'" + str(request_param['seller_types_id']) + "'"
                seller_info_filter += f' AND a.seller_types_id = {seller_types_id}'
            else:None

            # representative_name 있으면, representative_name WHERE like 조건 추가
            if 'representative_name' in request_param:
                representative_name = "'%" + str(request_param['representative_name']) + "%'"
                seller_info_filter += f' AND b.name like {representative_name}'
            else:None

            # mobile_number 있으면, mobile_number WHERE like 조건 추가
            if 'mobile_number' in request_param:
                mobile_number = "'%" + str(request_param['mobile_number']) + "%'"
                seller_info_filter += f' AND b.mobile_number like {mobile_number}'
            else:None

            # email 있으면, email WHERE like 조건 추가
            if 'email' in request_param:
                email = "'%" + str(request_param['email']) + "%'"
                seller_info_filter += f' AND b.email like {email}'
            else:None

            # CASE_1 셀러정보확인 쿼리      : GROUP BY 조건 및 limit과 offset 쿼리 추가
            # CASE_2 셀러정보카운트 쿼리    : GROUP BY 조건 쿼리 추가 
            seller_list_info_end_query      = '    GROUP BY a.id limit %(limit)s' + ' offset ' + '%(offset)s'
            serller_list_count_end_query    = '    GROUP BY a.id'

            seller_info_query               = select_seller_info + seller_info_filter + seller_list_info_end_query
            seller_info_count_query         = select_seller_count + seller_info_filter + serller_list_count_end_query

            # 셀러정보확인 쿼리 실행
            db_cursor.execute(seller_info_query, request_param)
            seller_list_data = db_cursor.fetchall()
            
            # seller_list에 query에 대한 data 입력
            for row in seller_list_data:             
                seller_data = {
                    'id'                    : row['id'],
                    'account'               : row['account'],
                    'name_kr'               : row['name_kr'],
                    'name_en'               : row['name_en'],
                    'site_url'              : row['site_url'],
                    'seller_status_id'      : row['seller_status_id'],
                    'seller_types_id'       : row['seller_types_id'],
                    'representative_name'   : row['ANY_VALUE(b.name)'],
                    'mobile_number'         : row['ANY_VALUE(b.mobile_number)'],
                    'email'                 : row['ANY_VALUE(b.email)'],
                    'created_at'            : row['created_at'],
                    'product_count'         : ''
                }
                seller_list.append(seller_data)
                # 셀러의 상품 카운트정보를 각 셀러에 매핑
                for i in range(len(seller_list)):
                    creator_id=seller_list[i]['id']
                    db_cursor.execute(count_seller_product, seller_list[i])
                    product_count = db_cursor.fetchone()['COUNT(creator_id)']
                    seller_list[i]['product_count'] = product_count
            
            # 셀러정보카운트확인 쿼리 실행
            db_cursor.execute(seller_info_count_query, request_param)
            seller_list_count = db_cursor.fetchall()
            seller_count = len(seller_list_count)
            

            return seller_list, seller_count
            db_cursor.close()
            
        except KeyError:
            abort(400, description="INVAILD_KEY")

        except mysql.connector.Error as err:
            traceback.print_exc()
            abort(400, description="INVAILD_DATA")
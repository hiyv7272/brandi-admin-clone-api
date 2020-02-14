import mysql.connector
from flask import abort

class ProductDao:

    BASIC_OPTION = 1
    NO_OPTION = 3

    def __init__(self, database):
        self.db_connection = database.get_connection()

    # 현재 등록되어 있는 product 개수를 반환
    def get_product_count(self, db_cursor):
        count_query = ("SELECT COUNT(*) FROM products_counts")
        db_cursor.execute(count_query)
        row = db_cursor.fetchone()
        # print(row['COUNT(*)'])
        return row['COUNT(*)']
    
    # 쿼리 실행 함수
    def execute_query(self, db_cursor, query):
        db_cursor.execute(query)
        return

    # 상품 정보 고지 테이블 삽입 함수
    def make_information_notices(self, db_cursor, request_json):
        info_data = {}
        information_notices_query = ("""
            INSERT INTO information_notices (
                manufacturer,
                manufacturing_date,
                origins_id,
                is_used
            ) VALUES (
                %(manufacturer)s,
                %(manufacturing_date)s,
                (SELECT id FROM origins WHERE name=%(origin)s limit 1),
                TRUE
            )
        """)

        # 상품정보고시 입력시 테이블 만듬 
        if request_json['information_notice_use']:
            info_json = request_json['information_notice']
            info_data['manufacturer'] = info_json['manufacturer']
            info_data['manufacturing_date'] = info_json['manufacturing_date']
            info_data['origin'] = info_json['origin']
            db_cursor.execute(information_notices_query, info_data)
            last_info_id = db_cursor.lastrowid
            # print("last_info_id=",end=""),print(last_info_id)
            return last_info_id

    # 상품 옵션 테이블 삽입 함수
    def make_options_info(self, db_cursor, request_json):
        print("here")
        option_info_data = {}
        option_info_query = ("""
            INSERT INTO option_info (
                option_types_id,
                is_used
            ) VALUES (
                %(option_types_id)s,
                TRUE
            )
        """)
    
        if request_json['option_types_id'] == self.NO_OPTION:
            option_info_data['option_types_id'] = self.NO_OPTION
        elif request_json['option_types_id'] == self.BASIC_OPTION:
            option_info_data['option_types_id'] = self.BASIC_OPTION

        db_cursor.execute(option_info_query, option_info_data)

        return db_cursor.lastrowid

    # 기본 옵션 테이블 삽입 함수
    def make_basic_options(self, db_cursor, request_json, option_info_id):

        option_info_json = request_json['option_info']

        for option_list in option_info_json:

            basic_options_data = {
                'option_info_id': option_info_id,
                'basic_options_colors_id' : option_list['basic_options_colors_id'],
                'basic_options_sizes_id' : option_list['basic_options_sizes_id'],
                'is_stock_managed': option_list['is_stock_managed'],
                'stock_volume': option_list['stock_volume'],
            }
        
            basic_options_query = ("""
                INSERT INTO basic_options (
                    option_info_id,
                    basic_options_colors_id,
                    basic_options_sizes_id,
                    is_stock_managed,
                    stock_volume,
                    is_used
                ) VALUES (
                    (SELECT id FROM option_info WHERE id=%(option_info_id)s limit 1),
                    (SELECT id FROM basic_options_colors WHERE name=%(basic_options_colors_id)s limit 1),
                    (SELECT id FROM basic_options_sizes WHERE name=%(basic_options_sizes_id)s limit 1),
                    %(is_stock_managed)s,
                    %(stock_volume)s,
                    TRUE
                )
            """)

            db_cursor.execute(basic_options_query, basic_options_data)

        return

    # 상품 개수 테이블 증가 함수
    def increase_product_counts(self, db_cursor, request, next_product_id):
        products_counts_data = {
            'id' : next_product_id
        }
        products_counts_query = "INSERT INTO products_counts (id) VALUES(%(id)s)"
        db_cursor.execute(products_counts_query, products_counts_data)

        return

    # 상품 테이블 삽입 함수
    def make_products(self, db_cursor, request_json, product_info):
        product_data = {
            'id' : product_info['next_product_id'],
            'name' : request_json['name'],
            'product_number' : product_info['next_product_id'],
            'serial_number' :  product_info['serial_number'],
            'is_temporary_save' : False,
            'is_sold' : request_json['is_sold'],
            'is_displayed' : request_json['is_displayed'],
            'is_used' : True,
            'first_categories_id' : request_json['first_category'],
            'second_categories_id' : request_json['second_category'],
            'information_notices_use' : request_json['information_notice_use'],
            'information_notices_id' : product_info['information_notices_id'] if request_json['information_notice_use'] else None,
            'one_line_description' : request_json['one_line_description'],
            'main_image' : request_json['main_image'],
            'image_1' : request_json['image_1'] if 'image_1' in request_json else None,
            'image_2' : request_json['image_2'] if 'image_2' in request_json else None,
            'image_3' : request_json['image_3'] if 'image_3' in request_json else None,
            'image_4' : request_json['image_4'] if 'image_4' in request_json else None,
            'detailed_info' : request_json['detailed_info'],
            'youtube_url' : request_json['youtube_url'] if 'youtube_url' in request_json else None,
            'option_info_id' : product_info['option_info_id'],
            'price' : request_json['price'],
            'discount_rate' : request_json['discount_rate'] if 'discount_rate' in request_json else None,
            'discount_price' : request_json['discount_price'] if 'discount_price' in request_json else None,
            'discounted_price' : request_json['discounted_price'] if 'discounted_price' in request_json else None,
            'discount_infinite_period' : request_json['discount_infinite_period'] if 'discount_infinite_period' in request_json else None,
            'discount_start_period' : request_json['discount_start_period'] if 'discount_start_period' in request_json else None,
            'discount_end_period' : request_json['discount_end_period'] if 'discount_end_period' in request_json else None,
            'minimum_quantity' : request_json['minimum_quantity'] if 'minimum_quantity' in request_json else None,
            'maximum_quantity' : request_json['maximum_quantity'] if 'maximum_quantity' in request_json else None,
            'product_tags_used' : True,
            'updated_at' : request_json['updated_at'] if 'updated_at' in request_json else None,
            'creator_id' : request_json['creator_id'] if 'creator_id' in request_json else None,
            'changer_id' : request_json['changer_id'] if 'changer_id' in request_json else None
        }
        product_query = ("""
            INSERT INTO products (
                id,
                name,
                product_number,
                serial_number,
                is_temporary_save,
                is_sold,
                is_displayed,
                is_used,
                first_categories_id,
                second_categories_id,
                information_notices_use,
                information_notices_id,
                one_line_description,
                main_image,
                image_1,
                image_2,
                image_3,
                image_4,
                detailed_info,
                youtube_url,
                option_info_id,
                price,
                discount_rate,
                discount_price,
                discounted_price,
                discount_infinite_period,
                discount_start_period,
                discount_end_period,
                minimum_quantity,
                maximum_quantity,
                product_tags_used,
                updated_at,
                creator_id,
                changer_id
            ) VALUES (
                %(id)s, 
                %(name)s, 
                %(product_number)s,
                %(serial_number)s,
                %(is_temporary_save)s,
                %(is_sold)s,
                %(is_displayed)s,
                %(is_used)s,
                (SELECT id from first_categories WHERE name=%(first_categories_id)s LIMIT 1),
                (SELECT id from second_categories WHERE name=%(second_categories_id)s LIMIT 1),
                %(information_notices_use)s,
                (SELECT id from information_notices WHERE id=%(information_notices_id)s LIMIT 1),
                %(one_line_description)s,
                %(main_image)s,
                %(image_1)s,
                %(image_2)s,
                %(image_3)s,
                %(image_4)s,
                %(detailed_info)s,
                %(youtube_url)s,
                (SELECT id from option_info WHERE id=%(option_info_id)s LIMIT 1),
                %(price)s,
                %(discount_rate)s,
                %(discount_price)s,
                %(discounted_price)s,
                %(discount_infinite_period)s,
                %(discount_start_period)s,
                %(discount_end_period)s,
                %(minimum_quantity)s,
                %(maximum_quantity)s,
                %(product_tags_used)s,
                %(updated_at)s,
                (SELECT id from accounts WHERE id=1 LIMIT 1),
                %(changer_id)s
            )
        """)
        db_cursor.execute(product_query, product_data)

        return

    def make_product_tags(self, db_cursor, request_json, product_id):
        
        product_tags_json = request_json['product_tags']
        product_tags_query = ("""
            INSERT INTO product_tags (
                products_id,
                name,
                is_used
            ) VALUES (
                (SELECT id from products WHERE id=%(products_id)s LIMIT 1),
                %(name)s,
                TRUE
            )
        """)

        for tag_list in product_tags_json:
            product_tags_data = {
                'products_id': product_id,
                'name' : tag_list
            }

            db_cursor.execute(product_tags_query, product_tags_data)
        
        return

    def register_product_dao(self, request):
        try:
            request_json = request.json
            # db_cursor = self.db.cursor(buffered=True, dictionary=True)
            db_cursor = self.db_connection.cursor(buffered=True, dictionary=True)

            next_product_id = self.get_product_count(db_cursor) + 1
            next_serial_number = 'SB000000000000' + str(next_product_id)

            # 여러 테이블에 동시에 데이터 변경이 일어나므로 트랜젝션 시작
            self.execute_query(db_cursor, "START TRANSACTION")
            self.execute_query(db_cursor, "SET AUTOCOMMIT=0")

            # 상품고시 테이블 삽입
            last_info_id = self.make_information_notices(db_cursor, request_json)

            # 옵션정보 테이블 삽입
            last_option_info_id = self.make_options_info(db_cursor, request_json)

            # 기본옵션 테이블 삽입
            self.make_basic_options(db_cursor, request_json, last_option_info_id)

            # 상품 개수 테이블 카운트 증가
            self.increase_product_counts(db_cursor, request_json, next_product_id)

            # 상품 테이블 삽입
            product_info = {
                'next_product_id' : next_product_id,
                'product_number'  : next_product_id,
                'serial_number'   : next_serial_number,
                'information_notices_id' : last_info_id,
                'option_info_id' : last_option_info_id
            }
            self.make_products(db_cursor, request_json, product_info)

            # 상품 태그 테이블 삽입
            self.make_product_tags(db_cursor, request_json, next_product_id)

            # 트랜젝션 종료
            self.db_connection.commit()
            # print("products_inserted_successfully")

        except KeyError as e:
            # print("except KeyError")
            # print(str(e))
            abort(400, description="INVAILD_KEY")

        except mysql.connector.Error as error:
            # 에러시 롤백
            print("Failed to update record to database rollback: {}".format(error))
            db_cursor.rollback()

        finally:
            # print("finally cursor close")
            db_cursor.close()

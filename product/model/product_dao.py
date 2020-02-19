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
        return db_cursor.lastrowid, option_info_data['option_types_id']

    # 기본 옵션 테이블 삽입 함수
    def make_basic_options(self, db_cursor, request_json, option_info_id, option_type):
        if 'option_info' in request_json:
            option_info_json = request_json['option_info']
            # 옵션타입에 따라 테이블에 삽입
            if option_type == self.BASIC_OPTION:
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
            elif option_type == self.NO_OPTION:
                no_option_data = {
                    'option_info_id'   : option_info_id,
                    'is_stock_managed' : option_info_json['is_stock_managed'],
                    'stock_volume'     : option_info_json['stock_volume']
                }
                no_option_query = ("""
                    INSERT INTO no_option (
                        option_info_id,
                        is_stock_managed,
                        stock_volume,
                        is_used
                    ) VALUES (
                        (SELECT id FROM option_info WHERE id=%(option_info_id)s limit 1),
                        %(is_stock_managed)s,
                        %(stock_volume)s,
                        TRUE
                    )
                """)
                db_cursor.execute(no_option_query, no_option_data)
        return

    # 상품 개수 테이블 증가 함수
    def increase_product_counts(self, db_cursor, request, next_product_id):
        products_counts_data = {
            'id' : next_product_id
        }
        products_counts_query = "INSERT INTO products_counts (id, is_used) VALUES(%(id)s, TRUE)"
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
            print("request data=", end=""), print(request_json) # for debug
            # db_cursor = self.db.cursor(buffered=True, dictionary=True)
            db_cursor = self.db_connection.cursor(buffered=True, dictionary=True)

            next_product_id = self.get_product_count(db_cursor) + 1
            next_serial_number = 'SB000000000000' + str(next_product_id)

            # 여러 테이블에 동시에 데이터 변경이 일어나므로 트랜젝션 시작
            self.execute_query(db_cursor, "START TRANSACTION")
            self.execute_query(db_cursor, "SET AUTOCOMMIT=0")

            # 1. 상품고시 테이블 삽입
            last_info_id = self.make_information_notices(db_cursor, request_json)
            
            # 2. 옵션정보 테이블 삽입
            last_option_info_id, option_type = self.make_options_info(db_cursor, request_json)

            # 3. 기본옵션 테이블 삽입
            self.make_basic_options(db_cursor, request_json, last_option_info_id, option_type)
            
            # 4. 상품 개수 테이블 카운트 증가
            self.increase_product_counts(db_cursor, request_json, next_product_id)

            # 5. 상품 테이블 삽입
            product_info = {
                'next_product_id'        : next_product_id,
                'product_number'         : next_product_id,
                'serial_number'          : next_serial_number,
                'information_notices_id' : last_info_id,
                'option_info_id'         : last_option_info_id
            }
            self.make_products(db_cursor, request_json, product_info)

            # 6. 상품 태그 테이블 삽입
            self.make_product_tags(db_cursor, request_json, next_product_id)

            # 트랜젝션 종료
            self.db_connection.commit()
            # print("products_inserted_successfully")

        except KeyError as e:
            print("except KeyError")
            print(str(e))
            abort(400, description="INVAILD_KEY")

        except mysql.connector.Error as error:
            # 에러시 롤백
            print("Failed to update record to database rollback: {}".format(error))
            db_cursor.rollback()

        finally:
            # print("finally cursor close")
            db_cursor.close()

    # 상세정보 반환 함수
    def get_product_detail(self, db_cursor, product_code):
        product_detail_data = {
            'serial_number' : product_code
        }
        products_detail_query = "SELECT *, COUNT(*) FROM products WHERE serial_number=%(serial_number)s"
        db_cursor.execute(products_detail_query, product_detail_data)
        product = db_cursor.fetchone()
        
        # 상품코드에 해당하는 상품이 없으면 에러리턴
        if product['COUNT(*)'] < 1:
            abort(400, description="NO PRODUCT")
        
        # Front에 불필요한 COUNT정보 삭제
        del product['COUNT(*)']

        return product

    # 기본 옵션 id를 name으로 바꿔주는 함수
    def replace_basic_option_with_name(self, db_cursor, option):
        options_data = {
            'basic_options_colors_id' : option['basic_options_colors_id'],
            'basic_options_sizes_id' : option['basic_options_sizes_id']
        }
        options_color_query = "SELECT name FROM basic_options_colors WHERE id=%(basic_options_colors_id)s"
        db_cursor.execute(options_color_query, options_data)
        option_color_name = db_cursor.fetchone()
        option['basic_options_colors_id'] = option_color_name['name']

        options_sizes_query = "SELECT name FROM basic_options_sizes WHERE id=%(basic_options_sizes_id)s"
        db_cursor.execute(options_sizes_query, options_data)
        option_size_name = db_cursor.fetchone()
        option['basic_options_sizes_id'] = option_size_name['name']
        return

    # 옵션 타입을 확인하여 기본정보가 추가된 상품이면 기본옵션 정보를 불러오는 함수
    def get_basic_options(self, db_cursor, product_code):
        option_info_id = int(product_code['option_info_id'])
        option_info_data = {
            'option_info_id' : option_info_id
        }
        option_info_query = "SELECT option_types_id FROM option_info WHERE id=%(option_info_id)s"
        db_cursor.execute(option_info_query, option_info_data)
        option_info = db_cursor.fetchone()

        if option_info['option_types_id'] is self.BASIC_OPTION:
            basic_options_query = ("""
                SELECT 
                    basic_options_colors_id,
                    basic_options_sizes_id,
                    is_stock_managed,
                    stock_volume
                FROM basic_options 
                WHERE option_info_id=%(option_info_id)s AND is_used=TRUE
            """)
            db_cursor.execute(basic_options_query, option_info_data)
            basic_option = db_cursor.fetchall()

            for option in basic_option:
                self.replace_basic_option_with_name(db_cursor, option)
            return basic_option

    # 상세 상품 정보를 DB에서 조회하여 리턴하는 함수
    def product_detail_dao(self, product_code):
        try:
            db_cursor = self.db_connection.cursor(buffered=True, dictionary=True)
            product = self.get_product_detail(db_cursor, product_code)

            # 기본 옵션 정보 추가
            basic_options=self.get_basic_options(db_cursor, product)

            # product 변수에 basic_options 키와 값을 추가
            product['basic_options'] = basic_options

            # print('final product return check=',end=''),print(product) # debug print
            return product
        
        except KeyError as e:
            print("except KeyError")
            print(str(e))
            abort(400, description="INVAILD_KEY")

        except mysql.connector.Error as error:
            # 에러시 롤백
            print("Failed to update record to database rollback: {}".format(error))
            db_cursor.rollback()

        finally:
            # print("finally cursor close")
            db_cursor.close()

    # 기본 페이지네이션 쿼리문 반환 함수
    def get_product_pagination_query(self, request, products_param):
        
        seller_attribute = request.args.get('seller_attribute')
        if seller_attribute is None:
            products_query = ("""
                SELECT 
                    products.created_at,
                    products.main_image,
                    products.name,
                    products.serial_number,
                    products.product_number,
                    products.price,
                    products.discounted_price,
                    products.is_sold,
                    products.is_displayed,
                    products.discount_price,
                    sq.name_kr,
                    sq.name AS seller_attr
                    FROM (products 
                INNER JOIN (SELECT sellers.accounts_id, sellers.name_kr, sellers.seller_types_id, seller_types.name FROM sellers INNER JOIN seller_types 
                ON sellers.seller_types_id=seller_types.id ) AS sq
                ON products.creator_id=sq.accounts_id)
            """)
        else:
            list_of_seller_attribute = seller_attribute.split(",")

            print("list_of_seller_attribute=", end=""), print(list_of_seller_attribute)

            if len(list_of_seller_attribute) <= 1:
                products_query = ("""
                    SELECT
                        products.created_at,
                        products.main_image,
                        products.name,
                        products.serial_number,
                        products.product_number,
                        products.price,
                        products.discounted_price,
                        products.is_sold,
                        products.is_displayed,
                        products.discount_price,
                        sq.name_kr,
                        sq.name AS seller_attr
                    FROM (products 
                    INNER JOIN (SELECT sellers.accounts_id, sellers.name_kr, sellers.seller_types_id, seller_types.name FROM sellers INNER JOIN seller_types 
                    ON sellers.seller_types_id=seller_types.id 
                    WHERE seller_types_id=(SELECT id from seller_types WHERE name=%(seller_attribute)s)) AS sq
                    ON products.creator_id=sq.accounts_id)
                """)
            elif len(list_of_seller_attribute) > 1:
                products_query = ("""
                    SELECT
                        products.created_at,
                        products.main_image,
                        products.name,
                        products.serial_number,
                        products.product_number,
                        products.price,
                        products.discounted_price,
                        products.is_sold,
                        products.is_displayed,
                        products.discount_price,
                        sq.name_kr,
                        sq.name AS seller_attr
                    FROM (products 
                    INNER JOIN (SELECT sellers.accounts_id, sellers.name_kr, sellers.seller_types_id, seller_types.name FROM sellers INNER JOIN seller_types 
                    ON sellers.seller_types_id=seller_types.id 
                """)

                for i in range(0, len(list_of_seller_attribute)):
                    if i == 0:
                        products_param['seller_attribute_'+str(i)] = list_of_seller_attribute[i]
                        products_query += ' WHERE (seller_types_id=(SELECT id from seller_types WHERE name=%(seller_attribute_0)s))'
                    elif i == 1:
                        products_param['seller_attribute_'+str(i)] = list_of_seller_attribute[i]
                        products_query += ' OR (seller_types_id=(SELECT id from seller_types WHERE name=%(seller_attribute_1)s))'

                products_query += ') AS sq ON products.creator_id=sq.accounts_id)'

        return products_query

    # 페이지네이션 날짜 조건 쿼리 함수
    def check_pagination_date(self, products_query, products_param, request, where_added):
        start_date = request.args.get('start_date')
        end_date = request.args.get('end_date')
        print("start_date=",end=""), print(start_date)
        print("end_date=",end=""), print(end_date)
        if start_date is not None and end_date is not None:
            products_param['start_date'] = start_date
            products_param['end_date'] = end_date
            where_added = True
            products_query += 'WHERE' + ' (created_at BETWEEN %(start_date)s AND %(end_date)s) '
        return products_query, where_added

    # 페이지네이션 셀러 조건 쿼리 함수, 서브쿼리로 accounts_id를 선택후 상품의 등록자 조건으로 걸어줌
    def check_pagination_seller(self, products_query, products_param, request, where_added):
        seller_name = request.args.get('seller_name')
        seller_name_query = 'AND ' if where_added else 'WHERE '
        if seller_name:
            products_param['seller_name'] = seller_name
            seller_name_query += '(creator_id=(select accounts_id from sellers where name_kr=%(seller_name)s)) '
            where_added = True
            products_query += seller_name_query
        return products_query, where_added

    # 페이지네이션 limit, offset 지정 함수
    def add_limit_offset(self, db_cursor, products_query, products_param):
        # offset 적용전 현재까지 찾은 조건에 대한 개수
        db_cursor.execute(products_query, products_param)
        rows = db_cursor.fetchall()
        # print("len of row=", end=""), print(len(rows))
        searched_count_before_offset = len(rows)

        # 날짜로 내림차순
        date_order = 'ORDER BY products.created_at DESC '
        products_query += date_order

        limit_offset = "LIMIT %(limit)s OFFSET %(offset)s"
        products_query += limit_offset
        return products_query, searched_count_before_offset

    # 페이지네이션 셀러 속성 쿼리 추가 함수
    def check_pagination_seller_attribute(self, products_query, products_param, request):
        seller_attribute = request.args.get('seller_attribute')
        if seller_attribute is not None:
            products_param['seller_attribute'] = seller_attribute

    # 상품명 쿼리 추가 함수
    def check_product_name(self, products_query, products_param, request, where_added):
        product_name = request.args.get('product_name')
        product_name_query = 'AND ' if where_added else 'WHERE '
        if product_name:
            products_param['product_name'] = '%{}%'.format(product_name)
            product_name_query += "(products.name LIKE %(product_name)s) "
            where_added = True
            products_query += product_name_query
        return products_query, where_added

    # 상품번호 쿼리 추가 함수
    def check_product_number(self, products_query, products_param, request, where_added):
        product_number = request.args.get('product_number')
        product_number_query = 'AND ' if where_added else 'WHERE '
        if product_number:
            products_param['product_number'] = int(product_number)
            product_number_query += '(product_number=%(product_number)s) '
            where_added = True
            products_query += product_number_query
        return products_query, where_added

    # 상품코드 쿼리 추가 함수
    def check_product_serial_number(self, products_query, products_param, request, where_added):
        product_serial_number = request.args.get('serial_number')
        product_serial_query = 'AND ' if where_added else 'WHERE '
        if product_serial_number:
            products_param['serial_number'] = product_serial_number
            product_serial_query += '(serial_number=%(serial_number)s) '
            where_added = True
            products_query += product_serial_query

        return products_query, where_added

    # 판매여부 쿼리 추가 함수
    def check_is_selling(self, products_query, products_param, request, where_added):
        s_is_sold = request.args.get('is_sold')
        is_sold_query = 'AND ' if where_added else 'WHERE '
        if s_is_sold:
            b_is_sold = True if s_is_sold == 'true' else False
            if b_is_sold:
                is_sold_query += '(is_sold=TRUE) '
            else:
                is_sold_query += '(is_sold=FALSE) '
        else:
            is_sold_query += '(is_sold=TRUE or is_sold=FALSE) '

        products_query += is_sold_query
        where_added = True
        return products_query, where_added

    # 진열여부 쿼리 추가 함수
    def check_is_displayed(self, products_query, products_param, request, where_added):
        s_is_displayed = request.args.get('is_displayed')
        is_displayed_query = 'AND ' if where_added else 'WHERE '
        if s_is_displayed:
            b_is_displayed = True if s_is_displayed == 'true' else False
            if b_is_displayed:
                is_displayed_query += '(is_displayed=TRUE) '
            else:
                is_displayed_query += '(is_displayed=FALSE) '
        else:
            is_displayed_query += '(is_displayed=TRUE or is_displayed=FALSE) '

        products_query += is_displayed_query
        where_added = True
        return products_query, where_added

    # 할인여부 쿼리 추가 함수
    def check_is_discounted(self, products_query, products_param, request, where_added):
        s_is_discounted = request.args.get('is_discounted')
        is_displayed_query = 'AND ' if where_added else 'WHERE '
        if s_is_discounted:
            b_is_discounted = True if s_is_discounted == 'true' else False
            if b_is_discounted:
                is_displayed_query += '(discount_rate is not null) '
            else:
                is_displayed_query += '(discount_rate is null) '
        else:
            is_displayed_query += '(discount_rate is not null or discount_rate is null) '

        products_query += is_displayed_query
        where_added = True
        return products_query, where_added

    # 상품 페이지네이션 함수
    def product_pagination_dao(self, request):
        try:
            print("pagination_dao start")
            limit = int(request.args.get('limit', 10))
            offset = (int(request.args.get('offset', 1))-1)*limit

            db_cursor = self.db_connection.cursor(buffered=True, dictionary=True)

            # 1. 동적 쿼리문 생성
            where_added = False
            products_param = {
                'limit':limit,
                'offset':offset,
            }
            products_query = self.get_product_pagination_query(request, products_param)

            # 1-1. 셀러 속성 조건
            self.check_pagination_seller_attribute(products_query, products_param, request)
            print("check_pagination_seller_attribute")

            # 1-1. 조회 기간 조건
            products_query, where_added = self.check_pagination_date(products_query, products_param, request, where_added)
            print("check_pagination_date")

            # 1-2. 셀러명 조건
            products_query, where_added = self.check_pagination_seller(products_query, products_param, request, where_added)

            # 1-3. 상품명
            products_query, where_added = self.check_product_name(products_query, products_param, request, where_added)

            # 1-4. 상품번호
            products_query, where_added = self.check_product_number(products_query, products_param, request, where_added)

            # 1-5. 상품코드
            products_query, where_added = self.check_product_serial_number(products_query, products_param, request, where_added)

            # 1-6. 판매여부
            products_query, where_added = self.check_is_selling(products_query, products_param, request, where_added)

            # 1-7. 진열여부
            products_query, where_added = self.check_is_displayed(products_query, products_param, request, where_added)

            # 1-8. 할인여부
            products_query, where_added = self.check_is_discounted(products_query, products_param, request, where_added)
    
            # 1-9. 오프셋 조건 : 반환하는 개수를 구하기 위해 limit, offset 설정
            products_query, searched_count_before_offset = self.add_limit_offset(db_cursor, products_query, products_param)

            total_product_cnt = self.get_product_count(db_cursor)

            # 2. 종합된 쿼리 실행
            print("final total query=",end=""), print(products_query)
            db_cursor.execute(products_query, products_param)
            rows = db_cursor.fetchall()

            # 3. 상품 리스트 리턴
            products_data = [
            {
                'created_at'        : row['created_at'],
                'main_image'        : row['main_image'],
                'name'              : row['name'],
                'serial_number'     : row['serial_number'],
                'product_number'    : row['product_number'],
                'price'             : row['price'],
                'discounted_price'  : row['discounted_price'],
                'is_sold'           : '판매' if row['is_sold'] else '미판매',
                'is_displayed'      : '진열' if row['is_displayed'] else '미진열',
                'is_discounted'     : '할인' if row['discount_price'] is not None else '미할인',
                'seller_name'       : row['name_kr'],
                'seller_type'       : row['seller_attr']
            } for row in rows]

            ret_products_data = {
                'total_count' : total_product_cnt,
                'search_count' : searched_count_before_offset,
                'products_count' : len(rows),
                'products_data'  : products_data
            }

            print("retuen data=",end=""), print(ret_products_data)
            print("pagination_dao end")
            return ret_products_data

        except KeyError as e:
            print("except KeyError")
            print(str(e))
            abort(400, description="INVAILD_KEY")
        
        except mysql.connector.Error as error:
            # 에러시 롤백
            print("Failed to update record to database rollback: {}".format(error))
            db_cursor.rollback()

        finally:
            # print("finally cursor close")
            db_cursor.close()

    # product id로 option id를 반환하는 함수
    def get_option_info_id_by_product_id(self, db_cursor, product_id):
        data_for_product_query = {
            'product_id' : product_id
        }

        product_query = ("""
            SELECT 
                option_info_id
            FROM products 
            WHERE id=%(product_id)s
        """)
        db_cursor.execute(product_query, data_for_product_query)
        option_info_id = db_cursor.fetchone()
        return option_info_id.get('option_info_id')

    # 기본 옵션 id를 name으로 바꿔주는 함수
    def replace_basic_option_with_id(self, db_cursor, option):
        options_data = {
            'basic_options_colors_id' : option['basic_options_colors_id'],
            'basic_options_sizes_id' : option['basic_options_sizes_id']
        }
        options_color_query = "SELECT id FROM basic_options_colors WHERE name=%(basic_options_colors_id)s"
        db_cursor.execute(options_color_query, options_data)
        option_color_id = db_cursor.fetchone()
        option['basic_options_colors_id'] = option_color_id['id']

        options_sizes_query = "SELECT id FROM basic_options_sizes WHERE name=%(basic_options_sizes_id)s"
        db_cursor.execute(options_sizes_query, options_data)
        option_size_id = db_cursor.fetchone()
        option['basic_options_sizes_id'] = option_size_id['id']
        return

    # 수정 option_info 와 기존 option_info를 비교하여 업데이트 하는 함수
    def update_basic_options(self, db_cursor, request, option_info_id):
        req_option_info = request.json.get('option_info')
        print("req_option_info=", end=""), print(req_option_info)

        option_type = request.json.get('option_types_id')
        print("option_type=", end=""), print(option_type)

        option_info_data = {
            'option_info_id' : option_info_id
        }

        if req_option_info and option_type == self.BASIC_OPTION:
            print("option info is not None and type is basic")
            basic_options_query = ("""
                SELECT 
                    basic_options_colors_id,
                    basic_options_sizes_id,
                    is_stock_managed,
                    stock_volume
                FROM basic_options 
                WHERE option_info_id=%(option_info_id)s AND is_used=TRUE
            """)
            ## 쿼리 실행
            db_cursor.execute(basic_options_query, option_info_data)
            basic_option = db_cursor.fetchall()

            # 1. 입력옵션과 비교하기 위해서 Foreign Key를 이름으로 바꿔준다.
            for option in basic_option:
                self.replace_basic_option_with_name(db_cursor, option)
                print("original saved option=", end=""), print(option)

            # 2. 입력옵션 req_option_info/ 기존옵션 basic_option 비교
            for input_option in req_option_info:
                print("input_option=",end=""),print(req_option_info)
                for option in basic_option:
                    # self.replace_basic_option_with_name(db_cursor, option)
                    print("option=", end=""), print(option)
                    # 수정할 새로 입력된 옵션 정보와 기존정보를 비교해서 기존 옵션 데이터에 remain 키를 표시해 놓음
                    if input_option['basic_options_colors_id'] == option['basic_options_colors_id'] \
                        and input_option['basic_options_sizes_id'] == option['basic_options_sizes_id']:
                        print("same color and size, so mark remain true")
                        option['remain'] = True
                    else:
                        print("new data add=", end=""), print(input_option)
                        # 기존 테이블에 없는 데이터 이므로 새로 추가한다.
                        # inner for문 도는 중이므로 loop 도는 수 만큼 더해지므로 한번만 쿼리를 실행하고 루프를 나가준다
                        option_add_data = {
                            'option_info_id'          : option_info_id,
                            'basic_options_colors_id' : input_option['basic_options_colors_id'] \
                                if 'basic_options_colors_id' in input_option else None,
                            'basic_options_sizes_id'  : input_option['basic_options_sizes_id'] \
                                if 'basic_options_sizes_id' in input_option else None,
                            'is_stock_managed'        : input_option['is_stock_managed'] \
                                if 'is_stock_managed' in input_option else None,
                            'stock_volume'            : input_option['stock_volume'] \
                                if 'stock_volume' in input_option else None
                        }
                        option_data_query = ("""
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
                        ## 쿼리 실행
                        db_cursor.execute(option_data_query, option_add_data)
                        break; # inner for문 도는 중이므로 loop 도는 수 만큼 더해지므로 한번만 쿼리를 실행하고 루프를 나감

            # 3. remain키 체크하여 remain key 가 없으면 기존 basic option table은 새로 입력된 키가 아니므로 소프트삭제
            for option in basic_option:
                self.replace_basic_option_with_id(db_cursor,option)
                print("checked option=", end=""), print(option)
                if 'remain' not in option:
                    print('remain is not in this option, so delete')
                    option_info_data = {
                        'option_info_id'          : option_info_id,
                        'basic_options_colors_id' : option['basic_options_colors_id'],
                        'basic_options_sizes_id'  : option['basic_options_sizes_id']
                    }

                    is_used_query = ("""
                        UPDATE basic_options SET is_used=False
                        WHERE option_info_id=%(option_info_id)s 
                        AND basic_options_colors_id=%(basic_options_colors_id)s
                        AND basic_options_sizes_id=%(basic_options_sizes_id)s
                    """)
                    ## 쿼리 실행
                    db_cursor.execute(is_used_query, option_info_data)
        return

    # 상품정보 변경 함수
    def modify_product_dao(self, request):
        try:
            print("modify_product_dao start")

            request_data = request.get_json()
            product_id = request.json.get('product_number')
            print("request_data=", end=""), print(request_data)
            print("product_id=", end=""), print(product_id)

            db_cursor = self.db_connection.cursor(buffered=True, dictionary=True)

            # 1. products_id로 부터 products 테이블의 option_info_id 구함
            option_info_id=self.get_option_info_id_by_product_id(db_cursor, product_id)

            # 2. basic_option 변경 처리
            self.update_basic_options(db_cursor, request, option_info_id)

            self.db_connection.commit()

            print("modify_product_dao end")

        except KeyError as e:
            print("except KeyError")
            print(str(e))
            abort(400, description="INVAILD_KEY")
        
        except mysql.connector.Error as error:
            # 에러시 롤백
            print("Failed to update record to database rollback: {}".format(error))
            db_cursor.rollback()

        finally:
            # print("finally cursor close")
            db_cursor.close()

import mysql.connector
from flask import abort

class ProductDao:

    def __init__(self, database):
        self.db = database

    # 현재 등록되어 있는 product 개수를 반환
    def get_product_count(self, db_cursor):
        count_query = ("SELECT COUNT(*) FROM products_counts")
        db_cursor.execute(count_query)
        row = db_cursor.fetchone()
        print(row['COUNT(*)'])
        return row['COUNT(*)']

    def execute_query(self, db_cursor, query):
        db_cursor.execute(query)
        return

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
            print("last_info_id=",end=""),print(last_info_id)
            return 

    def register_product_dao(self, request):
        try:
            print("start")
            request_json = request.json
            db_cursor = self.db.cursor(buffered=True, dictionary=True)
            
            next_product_id = self.get_product_count(db_cursor) + 1
            next_serial_number = 'SB000000000000' + str(next_product_id)

            # 여러 테이블에 동시에 데이터 변경이 일어나므로 트랜젝션 시작
            self.execute_query(db_cursor, "START TRANSACTION")
            self.execute_query(db_cursor, "SET AUTOCOMMIT=0")

            self.make_information_notices(db_cursor, request_json)

            # 트랜젝션 종료
            self.db.commit()
            print("end")

        except KeyError as e:
            print("except KeyError")
            print(str(e))
            abort(400, description="INVAILD_KEY")

        except mysql.connector.Error as error:
            # 에러시 롤백
            print("Failed to update record to database rollback: {}".format(error))
            self.db.rollback()

        finally:
            # print("finally cursor close")
            db_cursor.close()

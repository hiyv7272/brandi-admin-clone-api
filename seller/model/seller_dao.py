class SellerDao:

    def __init__(self, database):
        self.db = database

    def insert_seller(self, new_seller):
        db_cursor = self.db().cursor()

        query = ("""
            INSERT INTO sellers (
                account,
                name_kr,
                name_en,
                password
            ) VALUES (
                %(account)s,
                %(name_kr)s,
                %(name_en)s, 
                %(password)s
            )
        """)

        new_seller_data = {
            'account'  : new_seller['account'],
            'name_kr'  : new_seller['name_kr'],
            'name_en'  : new_seller['name_en'],
            'password' : new_seller['password']
        }
        db_cursor.execute(query, new_seller_data)
        self.db().commit()
        db_cursor.close()
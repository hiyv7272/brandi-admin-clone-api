class SellerDao:

    def __init__(self, database):
        self.db = database

    def test_seller_dao(self):
        db_cursor = self.db().cursor()

        query = ("SELECT * FROM first_category")
        db_cursor.execute(query)

        for items in db_cursor:
            t = items
            print(t[0])
            print(t[1])

        db_cursor.close()

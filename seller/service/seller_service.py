import bcrypt

class SellerService:

    def __init__(self, seller_dao):
        self.seller_dao = seller_dao

    def create_new_seller(self, new_seller):      
        new_seller['password'] = bcrypt.hashpw(  
            new_seller['password'].encode('UTF-8'),
            bcrypt.gensalt()
        )

        new_seller_id = self.seller_dao.insert_seller(new_seller)
        
        return new_seller_id
class SellerService:

    def __init__(self, seller_dao):
        self.seller_dao = seller_dao

    def test_seller_service(self):
        self.seller_dao.test_seller_dao()

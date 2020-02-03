class ProductService:

    def __init__(self, product_dao):
        self.product_dao = product_dao

    def test_product_service(self):
        self.product_dao.test_product_dao()

import io
import boto3
from PIL import Image
from uuid import uuid4
from werkzeug.utils import secure_filename

class ProductService:
    ALLOWED_EXTENSIONS = set(['jpg'])

    def __init__(self, product_dao, config):
        self.product_dao = product_dao
        self.config = config
        self.s3 = boto3.client(
            "s3",
            aws_access_key_id = config['S3_ACCESS_KEY'],
            aws_secret_access_key = config['S3_SECRET_KEY']
        )

    def allowed_image_file(self, filename):
        return '.' in filename and \
            filename.rsplit('.', 1)[1].lower() in self.ALLOWED_EXTENSIONS 

    def image_width_size(self, img_size):
        resizer={
            'small': (150, '_S'),
            'medium': (320, '_M'),
            'large': (640, '_L')
        }
        return resizer.get(img_size,"Invalid size")

    def resize_image(self, image_file, size):
        secure_file_name = secure_filename(image_file.filename)
        file_name = secure_file_name.rsplit('.', 1)[0]
        file_extension = secure_file_name.rsplit('.', 1)[1].lower()
        
        img_width, separator = self.image_width_size(size)

        base_filename = str(uuid4()) + '_' + file_name + separator + '.' + file_extension
        image_file.save(base_filename)

        img = Image.open(base_filename)    
        img_io = io.BytesIO()

        width_percent = (img_width/float(img.size[0]))
        img_height = int((float(img.size[1])*float(width_percent)))
        img = img.resize( (img_width,img_height), Image.ANTIALIAS)
        img.save(img_io, 'jpeg')
        img_io.seek(0)
        return img_io, base_filename

    def upload_image(self, image, filename):
        self.s3.upload_fileobj(
            image,
            self.config['S3_BUCKET'],
            filename
        )
        image_url = f"{self.config['S3_BUCKET_URL']}{filename}"
        return image_url

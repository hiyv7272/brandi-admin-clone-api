import os
import io
import boto3
from PIL import Image
from uuid import uuid4
from werkzeug.utils import secure_filename
from flask import current_app
from smart_open import open

class ProductService:
    ALLOWED_EXTENSIONS = set(['jpg'])

    def __init__(self, product_dao):
        self.product_dao = product_dao

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

    def resize_upload_image(self, image_file):

        filename, file_extension = os.path.splitext(image_file.filename)
        image_size_list = ['small','medium','large']
        img_urls = dict()

        for img_size in image_size_list:
            resize_width, separator = self.image_width_size(img_size)
            with Image.open(image_file) as opened_image:
                img_io = io.BytesIO()
                img_width = resize_width
                width_percent = (img_width/float(opened_image.size[0]))
                img_height = int((float(opened_image.size[1])*float(width_percent)))
                resized_image = opened_image.resize( (img_width,img_height), Image.ANTIALIAS)
                resized_image.save(img_io, 'jpeg')
                img_io.seek(0)

                uploaded_name = str(uuid4()) + filename + separator + file_extension
                with open('s3://{}:{}@{}/{}'. \
                    format(current_app.config['S3_ACCESS_KEY'], \
                    current_app.config['S3_SECRET_KEY'], \
                    current_app.config['S3_BUCKET'], \
                    uploaded_name), 'wb') as fout:
                    fout.write(img_io.getvalue())

                    uploaded_url = (
                        '{}{}'
                        .format(current_app.config['S3_BUCKET_URL'], uploaded_name)
                    )

                    if uploaded_url:
                        img_urls[img_size] = uploaded_url
        return img_urls

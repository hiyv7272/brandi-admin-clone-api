import os, io
import sys
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))))
from app import create_app
import pytest
from flask import json, jsonify

@pytest.fixture
def api():
    app = create_app()
    api = app.test_client()
    return api

def json_of_response(response):
    return json.loads(response.data.decode('utf8'))

def test_fail_by_file_format_image_resize_and_upload(api):
    resp = api.post(
        '/product/image',
        content_type = 'multipart/form-data',
        data = {'data': '{\"image_size\":\"small\"}', 'image_file' : (io.BytesIO(b'test_image'),'test_image.png')}
    )

    assert resp.status_code == 400
    assert json_of_response(resp) == {"message":"FILE FORMAT NOT ALLOWD"}

def test_fail_by_invalid_key_image_resize_and_upload(api):
    resp = api.post(
        '/product/image',
        content_type = 'multipart/form-data',
        data = {'data': '{\"image_size\":\"small\"}', 'file' : (io.BytesIO(b'test_image'),'test_image.png')}
    )

    assert resp.status_code == 400
    assert json_of_response(resp) == {"message":"INVALID KEY"}

def test_fail_by_invalid_params_image_resize_and_upload(api):
    resp = api.post(
        '/product/image',
        content_type = 'multipart/form-data',
        data = {'data': '{\"imag_size\":\"small\"}', 'file' : (io.BytesIO(b'test_image'),'test_image.png')}
    )

    assert resp.status_code == 400
    assert json_of_response(resp) == {"message":"INVALID PARAMS"}

'''
作者:smallMQ

'''
import os
APPID = '2021000118604176'

APP_NOTIFY_URL = 'http://127.0.0.1:8000/home/'

SIGN_TYPE = 'RSA2'

DEBUG = False


GATEWAY = 'https://openapi.alipay.com/gateway.do?' if DEBUG else 'https://openapi.alipaydev.com/gateway.do?'

RETURN_URL ='https://www.luffycity.com/free-course'

NOTIFY_URL = 'https://www.luffycity.com/free-course'

APP_PRIVATE_KEY_STRING = open(os.path.join(os.path.dirname(__file__),'pem','private_key.pem')).read()

ALIPAY_PUBLIC_KEY_STRING = open(os.path.join(os.path.dirname(__file__),'pem','ali_public_key.pem')).read()

'''
作者:smallMQ

'''

from alipay import AliPay

from . import settings


app_private_key_string = settings.APP_PRIVATE_KEY_STRING
alipay_public_key_string = settings.ALIPAY_PUBLIC_KEY_STRING


alipay = AliPay(
    appid=settings.APPID,
    app_notify_url=settings.APP_NOTIFY_URL,  # the default notify path
    app_private_key_string=app_private_key_string,
    # alipay public key, do not use your own public key!
    alipay_public_key_string=alipay_public_key_string,
    sign_type=settings.SIGN_TYPE,  # RSA or RSA2
    debug=settings.DEBUG  # False by default
)

alipay_url = settings.GATEWAY
# order_string = alipay.api_alipay_trade_page_pay(
#     out_trade_no="20161112www4334",
#     total_amount=9999,
#     subject='韩红版充气娃娃',
#     return_url=settings.RETURN_URL,
#     notify_url=settings.NOTIFY_URL
# )
# print(alipay_url + order_string)
gateway = settings.GATEWAY

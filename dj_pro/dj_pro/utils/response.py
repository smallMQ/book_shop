'''
作者:smallMQ

'''
from rest_framework.response import Response


class ApiResponse(Response):
    def __init__(self, code=100, msg='成功', status=None, headers=None, result=None,
                 content_type=None, **kwargs):
        dic = {
            'code': code,
            'msg': msg
        }
        if result is not None:
            dic['result'] = result
        dic.update(kwargs)
        super().__init__(data=dic, status=status, headers=headers, content_type=content_type)

from flask import Flask
from flask import request

WEB_SERVER_BIND_ADDRESS = '0.0.0.0'
WEB_SERVER_PORT = 8000

webapp = Flask('hello')

template="""
<!DOCTYPE html>\r\n
<html>\r\n<head>\r\n
<meta charset=\"utf-8\">\r\n
<title>WebHello</title>\r\n
</head>\r\n<body>\r\nHello, \"{addr}\".\r\n</body>\r\n</html>\r\n
"""

@webapp.route("/", methods=['GET'])
def hello():
  return template.format(addr=request.remote_addr)

if __name__ == '__main__':
  webapp.run(host=WEB_SERVER_BIND_ADDRESS, port=WEB_SERVER_PORT)

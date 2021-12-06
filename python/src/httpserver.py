from http.server import BaseHTTPRequestHandler, HTTPServer
import logging
import base64
import re
import json
from main import process
def Get2Dic(path):
    """
    将get请求的参数转化为字典
    @param path  最好是问号后面的，不然会出错
    """
    parameters={}
    for i in path.split("&"):
        t=i.split('=')
        parameters[t[0]]=t[1]
    return parameters
class S(BaseHTTPRequestHandler):
    def do_HEAD(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()

    def do_GET(self):
        self.parse_request
        # paths = {
        #     '/foo': {'status': 200},
        #     '/bar': {'status': 302},
        #     '/baz': {'status': 404},
        #     '/qux': {'status': 500}
        # }
        
        # if self.path in paths:
        #     self.respond(paths[self.path])
        # else:
        # parameters=Get2Dic(self.path.split("?",1)[1])
        # print(parameters["video_url"])
        video_url=base64.b64decode(self.path.split("?",1)[1]).decode()
        #获取到文件的url以后，就可以进行文件处理了，需要返回处理后文件的url。
        # img_names=["1.jpg", "2.jpg", "3.jpg"]
        img_names=process(video_url)
        data={}
        for i in range(0,len(img_names)):
            img_names[i]="../../img/"+img_names[i]
        data["img_urls"]=img_names
        data=json.dumps(data)
        print(data)

        logging.info("GET request,\nPath: %s\nHeaders:\n%s\n", str(self.path), str(self.headers))
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(bytes(data,encoding='utf-8'))

    def do_POST(self):
        content_length = int(self.headers['Content-Length']) # <--- Gets the size of data
        post_data = self.rfile.read(content_length) # <--- Gets the data itself

        logging.info("POST request,\nPath: %s\nHeaders:\n%s\n\nBody:\n%s\n",
                str(self.path), str(self.headers), post_data.decode('utf-8'))

        res = "You Input: " + post_data.decode('utf-8')

        self.do_HEAD()
        # self.wfile.write("POST request for {}".format(self.path).encode('utf-8'))
        self.wfile.write("{}".format(res).encode('utf-8'))
        # self.wfile.write("POST request for {ASS}".format(data).encode('utf-8'))

    def respond(self, opts):
        response = self.handle_http(opts['status'], self.path)
        self.wfile.write(response)

    def handle_http(self, status_code, path):
        self.send_response(status_code)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        content = '''
           <html><head><title>Title goes here.</title></head>
           <body><p>This is a test.</p>
           <p>You accessed path: {}</p>
           </body></html>
           '''.format(path)
        return bytes(content, 'UTF-8')


def run(server_class=HTTPServer, handler_class=S, port=8081):
    print("run()")
    logging.basicConfig(level=logging.INFO)
    server_address = ('', port)
    httpd = server_class(server_address, handler_class)
    logging.info('Starting httpd...\n')
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        pass
    httpd.server_close()
    print("httpd.server_close()")
    logging.info('Stopping httpd...\n')


if __name__ == '__main__':
    from sys import argv

    if len(argv) == 2:
        run(port=int(argv[1]))
    else:
        run()

#!/usr/bin/python3

from http.server import BaseHTTPRequestHandler, HTTPServer

class RequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        message = "Hello! You are unauthorized!"
        if "X-SSL-CERT" in self.headers:
          message = "Hi, cert owner!\n" + self.headers["X-SSL_CERT"]

        self.protocol_version = "HTTP/1.1"
        self.send_response(200)
        self.send_header("Content-Length", len(message))
        self.end_headers()

        self.wfile.write(bytes(message, "utf8"))
        return

def run():
    server = ('', 1337)
    httpd = HTTPServer(server, RequestHandler)
    httpd.serve_forever()
run()

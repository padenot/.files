#!/usr/bin/python
import SimpleHTTPServer
import SocketServer

PORT = 8000

Handler = SimpleHTTPServer.SimpleHTTPRequestHandler

Handler.extensions_map["aif"]  = "audio/x-aiff"
Handler.extensions_map["aifc"] = "audio/x-aiff"
Handler.extensions_map["aiff"] = "audio/x-aiff"
Handler.extensions_map["au"]   = "audio/basic"
Handler.extensions_map["flv"]  = "video/x-flv"
Handler.extensions_map["m3u"]  = "audio/x-mpegurl"
Handler.extensions_map["mid"]  = "audio/mid"
Handler.extensions_map["mkv"]  = "video/x-matroska"
Handler.extensions_map["mov"]  = "video/quicktime"
Handler.extensions_map["mp3"]  = "audio/mpeg"
Handler.extensions_map["mp4"]  = "video/mp4"
Handler.extensions_map["mpeg"] = "video/mpeg"
Handler.extensions_map["oga"]  = "audio/ogg"
Handler.extensions_map["ogg"]  = "video/ogg"
Handler.extensions_map["ogv"]  = "video/ogg"
Handler.extensions_map["ra"]   = "audio/x-pn-realaudio"
Handler.extensions_map["ram"]  = "audio/vnd.rn-realaudio"
Handler.extensions_map["rmi"]  = "audio/mid"
Handler.extensions_map["snd"]  = "audio/basic"
Handler.extensions_map["wav"]  = "audio/wav"
Handler.extensions_map["wax"]  = "audio/x-ms-wax"
Handler.extensions_map["webm"] = "video/webm"
Handler.extensions_map["wma"]  = "audio/x-ms-wma"
Handler.extensions_map["wmv"]  = "video/x-ms-wmv"
Handler.extensions_map["appcache"] = "text/cache-manifest"

retry = True
while retry:
  try:
    httpd = SocketServer.TCPServer(("", PORT), Handler)
    retry = False
  except:
    retry = True
    PORT=PORT+1

print "serving at port", PORT
httpd.serve_forever()

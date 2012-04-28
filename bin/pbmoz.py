#!/usr/bin/python
import urllib, sys

if len(sys.argv) == 2:
    url = "http://%s.pastebin.mozilla.org" % sys.argv[1]
    fmt = sys.argv[1]
else:
    url = "http://pastebin.mozilla.org"
    fmt = "None"

body = sys.stdin.read()

params = [
    ('parent_pid', ''),
    ('code2', body),
    ('poster', ''),
    ('expiry', 'd'),
    ('paste', 'Send'),
    ('format', fmt),
    ]

data = urllib.urlencode(params)

req = urllib.urlopen(url, data)

print req.geturl()
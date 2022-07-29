#!/usr/bin/python
#-*- coding: utf-8 -*-
import requests
import json
import sys
import os

headers = {'Content-Type': 'application/json;charset=utf-8'}
api_url = "https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=439c18d1-a548-4c65-ac76-9d441f"

def msg(text):
    json_text= {
     "msgtype": "text",
        "text": {
            "content": text
        },
    }
    print (requests.post(api_url,json.dumps(json_text),headers=headers).content)

if __name__ == '__main__':
    text = sys.argv[0]
    msg(text)

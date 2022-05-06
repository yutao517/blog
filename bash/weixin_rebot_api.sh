#!/bin/bash

curl https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=439c18*** -H 'Content-Type: application/json' -d '{"msgtype": "text","text": {"content": "$1"}}'  

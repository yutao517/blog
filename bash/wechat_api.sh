#!/bin/bash

corpid="wwaa6fb8ff1b81aa77"	#企业id
corpsecret="CxydMDAEscOL7Hqbqphf77rY3HpVsJDu4cizLwg-YMI"	#你的corpsecret
url="https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=$corpid&corpsecret=$corpsecret"
#echo $url
token=$(curl -s $url|awk -F'"' '{print $10}')	#截取token
#echo $token
#echo $url2
body(){
        printf '{'
        printf '"touser": "@all",'
        printf '\t"msgtype": "text",'
        printf '\t"agentid": "1000002",'    #你的agentid
        printf '"text": {'
        printf '"content": '"$1"
        printf '},'
        printf '"safe":"0"'
        printf '}'
} 
curl -d "$(body $1)" https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=$token -s

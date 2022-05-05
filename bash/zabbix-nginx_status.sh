#!/bin/bash
case $1 in
        active)
                curl http://192.168.2.58:80/wyt_status 2>/dev/null|awk '/Active/ {print $NF}'
                ;;
        accepts)
                curl http://192.168.2.58:80/wyt_status 2>/dev/null|awk 'NR==3 {print $1}'
                ;;
        handled)
                curl http://192.168.2.58:80/wyt_status 2>/dev/null |awk 'NR==3 {print $2}'
                ;;
        requests)
                curl http://192.168.2.58:80/wyt_status 2>/dev/null |awk 'NR==3 {print $3}'
                ;;
        reading)
                curl http://192.168.2.58:80/wyt_status 2>/dev/null |awk 'NR==4 {print $2}'
                ;;
        writing)
                curl http://192.168.2.58:80/wyt_status 2>/dev/null |awk 'NR==4 {print $4}'
                ;;
        waiting)
                curl http://192.168.2.58:80/wyt_status 2>/dev/null |awk 'NR==4 {print $NF}'
                ;;
           ping)
                pidof nginx |wc -l
                #通过查询进程PID值，测试nginx存活状态
                ;;

esac  

#!/bin/sh

if expr "$1" : "start" 1>/dev/null || [ "$1" = "update" ]; then
   curl -s -o /dev/null mirrors.aliyun.com
   if [ $? -eq 0 ];then
      echo "mirrors.aliyun.com is ok ..."
   else
      echo "Can't connect mirrors.aliyun.com,please check network ..."
      exit 1
   fi
fi

exec "$@"


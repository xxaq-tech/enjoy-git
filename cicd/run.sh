#!/bin/sh

#修改hosts
#echo "10.68.4.15 xxx.com" >> /etc/hosts

#启动服务,${JVM_PARAM}参数可外部通过环境变量引入实际值
#java -jar app.jar ${JVM_PARAM}
java  -jar app.jar
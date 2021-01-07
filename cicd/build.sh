#!/bin/bash
APP_NAME=enjoy-git
APP_PKG_DIR=测试流水线/
APP_PKG=enjoy-git
DEST_DIR=build_dest_dir
#参数1
IMAGE=192.168.18.133/library/${APP_NAME}
#参数2
TAG=$(date +%Y%m%d%H%M%S)
#TAG=lastet

#参数赋值
if [ x"$1" != x ]
then
    IMAGE=$1
fi

if [ x"$2" != x ]
then
    TAG=$2
fi

#---------- 创建docker构建目录 ----------
rm -rf  ${DEST_DIR}
mkdir ${DEST_DIR}

#---------- 复制必要的文件到Docker构建目录 ----------
cp -r cicd/*  ${DEST_DIR}
cp ${APP_PKG_DIR}target/enjoy-git-1.0-SNAPSHOT请移除快照.war ${DEST_DIR}/app.tar.gz

#---------- 构建Docker镜像,$0为外部传入目标镜像库项目和标签路径 ----------
rm -f docker_build_result.log
cd ${DEST_DIR}
docker build -t "${IMAGE}":"${TAG}" .| tee ../docker_build_result.log

#建日志打印和构建结果返回
#RESULT=$(cat ../Docker_build_result.log | tail -n 1)

#if [["$RESULT" != *Successfully*]];then
#  exit -1
#fi
#docker push "${IMAGE}":"${TAG}"
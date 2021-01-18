ARG BASE_IMAGE="192.168.80.133/library/jdk:8u171"

FROM $BASE_IMAGE
MAINTAINER zhangzhi <zhangzhi@worktrans.cn>
LABEL \
        org.worktrans.maintainer="zhangzhi<tz826@qq.com>"  \
        org.worktrans.app.vendor="Worktrans"

ENV APP_PATH="/"
#根目录创建app目录
RUN mkdir $APP_PATH
WORKDIR  $APP_PATH
#COPY . /app
COPY Dockerfile \
     run.sh \
      $APP_PATH

#自动解压到app目录,注意最后/必须有
ADD app.tar.gz  $APP_PATH

#修改Dokcerfile默认shell,默认/bin/sh
SHELL ["/bin/bash","-c"]
#sh文件授权
RUN chmod +x $APP_PATH/*.sh
#调试镜像文件列表信息
RUN ls -lah
RUN java -version
#默认是SIGTERM,需要应用自行处理信号
STOPSIGNAL SIGINT

#容器启动执行命令
CMD ["/run.sh"]
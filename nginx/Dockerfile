FROM centos:7
ENV NGINX_VERSION 1.21.4
ENV AUTHOR wangyutao
LABEL maintainer="wangyutao<wyt1271030564@gmail.com>"
RUN mkdir /wyt_nginx
WORKDIR /wyt_nginx
COPY . /wyt_nginx 
RUN set -ex; \
    bash one-key-nginx-install.sh \
    yum install vim -y \
    yum install iputils -y \
    yum install net-tools -y \
    yum install iproute-4.11.0-30.el7.x86_64 -y
ENV PATH=/usr/local/nginx/sbin:$PATH
EXPOSE 80
STOPSIGNAL SIGQUIT
CMD ["nginx","-g","daemon off;"]

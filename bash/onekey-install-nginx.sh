#!/bin/bash

#解决软件的依赖关系，需要安装的软件包
yum -y install zlib zlib-devel openssl openssl-devel pcre pcre-devel gcc gcc-c++ autoconf automake make psmisc net-tools lsof vim geoip geoip-devel wget -y

#新建luogan用户和组
id  wangyutao || useradd wangyutao -s /sbin/nologin

#下载nginx软件
mkdir  /wangyutao99 -p
cd /wangyutao99
wget  https://nginx.org/download/nginx-1.21.4.tar.gz

#解压软件
tar xf nginx-1.21.4.tar.gz 
#进入解压后的文件夹
cd nginx-1.21.4

#编译前的配置
./configure --prefix=/usr/local/scwangyutao99  --user=wangyutao --group=wangyutao  --with-http_ssl_module   --with-threads  --with-http_v2_module  --with-http_stub_status_module  --with-stream  --with-http_geoip_module --with-http_gunzip_module

#如果上面的编译前的配置失败，直接退出脚本
if (( $? != 0));then
	exit
fi
#编译
make -j 2
#编译安装
make  install

#修改PATH变量
echo  "PATH=$PATH:/usr/local/scwangyutao99/sbin" >>/root/.bashrc
#执行修改了环境变量的脚本
source /root/.bashrc


#firewalld and selinux

#stop firewall和设置下次开机不启动firewalld
service firewalld stop
systemctl disable firewalld

#临时停止selinux和永久停止selinux
#setenforce 0
#sed  -i '/^SELINUX=/ s/enforcing/disabled/' /etc/selinux/config

#开机启动
chmod +x /etc/rc.d/rc.local
echo  "/usr/local/scwangyutao99/sbin/nginx" >>/etc/rc.local

#修改nginx.conf的配置，例如：端口号，worker进程数，线程数，服务域名

sed  -i '/worker_processes/ s/1/2/' /usr/local/scwangyutao99/conf/nginx.conf
sed  -i  '/worker_connections/ s/1024/2048/' /usr/local/scwangyutao99/conf/nginx.conf
sed  -i -r '36c \\tlisten  80;' /usr/local/scwangyutao99/conf/nginx.conf
sed  -i -r '37c \\tserver_name www.wangyutao.com;' /usr/local/scwangyutao99/conf/nginx.conf

#killall nginx进程
killall -9 nginx

#启动nginx
/usr/local/scwangyutao99/sbin/nginx




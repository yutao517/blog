## 二进制脚本一键安装
```bash
wget https://cdn.mysql.com/archives/mysql-5.7/mysql-5.7.34-linux-glibc2.12-x86_64.tar.gz #下载二进制安装包
bash <(curl -s -L https://cdn.jsdelivr.net/gh/yutao517/blog@main/bash/one-key-install-mysql)
su -root #切换到root用户加载
service mysqld start
ps aux|grep mysqld #判断MySQL是否运行
```
**mysqld和mysql_safe**
>mysql_safe是父进程，mysqld是子进程

## 允许远程连接MySQL
		
第一种方法
```bash
grant all on *.* to 'root'@'%' identified by '123456';
#grant是授权命令，all表示所有的权限，on *.*在所有库里的所有表，第一个*表示库，第二个*表示表，to 'root'@'%'表示允许root这个用户从任何地方连接过来登录，设置密码为123456
```
第二种方法
```bash
use mysql;
update user set host = '%' where user = 'root';
select host, user from user;
flush privileges;#设置完成后打开服务器安全组配置放行端口3306
```
## 修改MySQL密码为123456
```bash
alter user 'root'@'localhost' identified by '123456';
#set password for root@localhost = password('123456'); 
```
## MySQL重置密码为123456

```bash
bash <(curl -s -L https://cdn.jsdelivr.net/gh/yutao517/blog@main/bash/reset-mysql-pwd.sh)
mysql -uroot -p123456 #登录
```
## 创建用户wyt本地登录

```bash
mysql>create user 'wyt'@'localhost' identified by '123456';
mysql>select user,host from mysql.user; #查看用户
+---------------+-----------+
| user          | host      |
+---------------+-----------+
| root          | %         |
| mysql.session | localhost |
| mysql.sys     | localhost |
| root          | localhost |
| wyt           | localhost |
+---------------+-----------+
mysql>drop user 'wyt'@'localhost';
```

## 查看MySQL版本

```bash
1.登录的时候版本提示
2. mysql>select version();
+-----------+
| version() |
+-----------+
| 5.7.34    |
+-----------+
3.mysql>show variables like 'version';
+---------------+--------+
| Variable_name | Value  |
+---------------+--------+
| version       | 5.7.34 |
+---------------+--------+

```

## Windows无法远程连接到MySQL的原因

> 1.windows网络问题
> 2.是否授权用户远程登陆
> 3.linux防火墙问题
> 4.检查mysqld服务是否打开
> 5.检查下端口号是否修改
> 6.云服务器安全组配置

## 基本命令

```bash
mysql>show variables\G; #查看变量\G以行显示
mysql>show character set; #查看字符集
mysql>show processlist; #查看登录mysql的用户
mysql>select user(); #查看当前登录mysql的用户
+----------------+
| user()         |
+----------------+
| root@localhost |
+----------------+
mysql>select database();#查看当前所在的库
+------------+
| database() |
+------------+
| wyt        |
+------------+

```

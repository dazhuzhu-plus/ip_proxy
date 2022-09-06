echo -------------------自动化一键安装squid的shell脚本-------------------
# 1.安装squid静默安装， -y：默认yes
echo -------------------启动squid静默安装-------------------
yum install -y squid
# 2.下载并替换本地squid配置文件， -O：文件保存路径
echo -------------------下载并替换本地squid配置文件-------------------
wget -O "/etc/squid/squid.conf" "https://github.com/dazhuzhu-plus/ip_proxy/releases/download/configuration/squid.conf"
echo -------------------创建/usr/lib/squid文件夹-------------------
mkdir "/usr/lib/squid"
echo  -------------------静默安装httpd-------------------
yum install httpd-tools -y
#安装openssl
echo  -------------------静默安装openssl-------------------
yum install openssl -y
echo  -------------------生成squid代理账号,用户为admin,密码为admin123-------------------
htpasswd -c -b /usr/lib/squid/passwd admin  admin123
# 3.  检查参数
echo -------------------检查参数-------------------
squid -k parse
# 4.  初始化缓存
echo -------------------初始化缓存-------------------
squid -z
echo -------------------启动squid-------------------
systemctl start squid
echo -------------------下载requirements文件-------------------
wget -O "~/" "https://github.com/dazhuzhu-plus/ip_proxy/releases/download/configuration/squid.conf"
echo -------------------pip安装requirements文件-------------------
pip install -r requirements.txt
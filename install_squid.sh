##################自动化一键安装squid的shell脚本#############
# 1.安装squid静默安装， -y：默认yes
yum install -y squid
# 2.下载并替换本地squid配置文件， -O：文件保存路径
wget -O "/etc/squid/squid.conf" "https://github.com/dazhuzhu-plus/ip_proxy/releases/download/configuration/squid.conf"
# 3.  检查参数
squid -k parse
# 4.  初始化缓存
squid -z


sshpass -p woaini1314 ssh -p 10004 root@222.187.223.190 curl "https://github.com/dazhuzhu-plus/ip_proxy/releases/download/configuration/install_squid.sh" | bash'
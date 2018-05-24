#!/bin/sh
# *********************************************************
# l12_app_1.sh
# agctlによるapache登録
# rootで実行
# *********************************************************

echo "--------------------------------------------------------"
echo "/u01/app/12.1.0/grid/bin/agctl add apache_webserver apache --apache_home /opt/acfsmount/acfs/apache --configuration_file /opt/acfsmount/acfs/apache/conf/httpd.conf --network 1 --ip apache-vip --user root --group root --server_pool ora.srvpool1"
/u01/app/12.1.0/grid/bin/agctl add apache_webserver apache --apache_home /opt/acfsmount/acfs/apache --configuration_file /opt/acfsmount/acfs/apache/conf/httpd.conf --network 1 --ip apache-vip --user root --group root --server_pool ora.srvpool1

echo "--------------------------------------------------------"
echo "/u01/app/12.1.0/grid/bin/agctl status apache_webserver apache"
/u01/app/12.1.0/grid/bin/agctl status apache_webserver apache

echo "--------------------------------------------------------"
echo "/u01/app/12.1.0/grid/bin/crsctl status resource -t -w "NAME co xag""
/u01/app/12.1.0/grid/bin/crsctl status resource -t -w "NAME co xag"

echo "--------------------------------------------------------"
echo "/u01/app/12.1.0/grid/bin/agctl start apache_webserver apache --node node1"
/u01/app/12.1.0/grid/bin/agctl start apache_webserver apache --node node1

echo "--------------------------------------------------------"
echo "/u01/app/12.1.0/grid/bin/agctl status apache_webserver apache"
/u01/app/12.1.0/grid/bin/agctl status apache_webserver apache

echo "--------------------------------------------------------"
echo "/u01/app/12.1.0/grid/bin/crsctl status resource -t -w "NAME co xag""
/u01/app/12.1.0/grid/bin/crsctl status resource -t -w "NAME co xag"
echo "--------------------- -----------------------------------"

#!/bin/sh
# *************************************************************
# l12_app_3.sh
# apacheの停止とリソースのremove
# rootで実行
# ************************************************************

echo "--------------------------------------------------------"
echo "/u01/app/12.1.0/grid/bin/agctl stop apache_webserver apache"
/u01/app/12.1.0/grid/bin/agctl stop apache_webserver apache

echo "--------------------------------------------------------"
echo "/u01/app/12.1.0/grid/bin/agctl status apache_webserver apache"
/u01/app/12.1.0/grid/bin/agctl status apache_webserver apache

echo "--------------------------------------------------------"
echo "/u01/app/12.1.0/grid/bin/crsctl status resource -t -w "NAME co xag""
/u01/app/12.1.0/grid/bin/crsctl status resource -t -w "NAME co xag"

echo "--------------------------------------------------------"
echo "/u01/app/12.1.0/grid/bin/agctl remove apache_webserver apache"
/u01/app/12.1.0/grid/bin/agctl remove apache_webserver apache
echo "--------------------- -----------------------------------"

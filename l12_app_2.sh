#!/bin/sh
# ***************************************************************
# l12_app_2.sh
# apacheのrelocateとステータス確認
# rootで実行
# *************************************************************** 
echo "--------------------------------------------------------"
echo "/u01/app/12.1.0/grid/bin/agctl relocate apache_webserver apache --node node2"
/u01/app/12.1.0/grid/bin/agctl relocate apache_webserver apache --node node2

echo "--------------------------------------------------------"
echo "/u01/app/12.1.0/grid/bin/agctl status apache_webserver apache"
/u01/app/12.1.0/grid/bin/agctl status apache_webserver apache

echo "--------------------------------------------------------"
echo "/u01/app/12.1.0/grid/bin/crsctl status resource -t -w "NAME co xag""
/u01/app/12.1.0/grid/bin/crsctl status resource -t -w "NAME co xag"
echo "--------------------- -----------------------------------"

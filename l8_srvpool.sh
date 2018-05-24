#!/bin/sh
# ***********************************************
# l8_srvpool.sh
# サーバープールの属性変更
# oracleで実行
# **********************************************
echo "-------------------------------------------------------"
echo  "srvctl status database -d orcl"
srvctl status database -d orcl

echo "--------------------------------------------------------"
echo "srvctl status srvpool -a"
srvctl status srvpool -a

echo "--------------------------------------------------------"
echo  "srvctl config srvpool"
srvctl config srvpool

echo "--------------------------------------------------------"
echo "srvctl modify srvpool -g srvpool1 -u 1 -f -eval"
srvctl modify srvpool -g srvpool1 -u 1 -f -eval


echo "--------------------------------------------------------"
echo "srvctl modify srvpool -g srvpool1 -u 1 -f"
srvctl modify srvpool -g srvpool1 -u 1 -f


echo "--------------------------------------------------------"
echo "srvctl status database -d orcl"
srvctl status database -d orcl

echo "--------------------------------------------------------"
echo  "srvctl status srvpool -a"
srvctl status srvpool -a

echo "--------------------------------------------------------"
echo  "srvctl config srvpool"
srvctl config srvpool

echo "--------------------------------------------------------"
echo  "srvctl modify srvpool -g srvpool1 -u 2 -eval"
srvctl modify srvpool -g srvpool1 -u 2 -eval

echo "--------------------------------------------------------"
echo "srvctl modify srvpool -g srvpool1 -u 2"
srvctl modify srvpool -srvpool1 -u -2

echo "--------------------------------------------------------"
echo  "srvctl status database -d orcl"
srvctl status database -d orcl

echo "--------------------------------------------------------"

echo  "srvctl status srvpool -a"
srvctl status srvpool -a

echo "--------------------------------------------------------"
echo "srvctl config srvpool"
srvctl config srvpool

echo "--------------------------------------------------------"

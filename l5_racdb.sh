#!/bin/sh
# ********************************************************** #
# l5_racdb.sh                                   #
# データベースの起動停止、ステータスを確認するスクリプ        #
# oracleで実行する                                             #
# ********************************************************** #

echo "------- chapter5_1.sh Start--------------------"
echo "srvctl config database -d orcl"
srvctl config database -d orcl
echo "-------------------------------------------- "
echo "srvctl status database -d orcl"
srvctl status database -d orcl
echo "-------------------------------------------- "
echo "srvctl stop database -d orcl -eval"
srvctl stop database -d orcl -eval
echo "-------------------------------------------- "
echo "srvctl stop database -d orcl"
srvctl stop database -d orcl
echo "-------------------------------------------- "
echo "srvctl status database -d orcl"
srvctl status database -d orcl
echo "-------------------------------------------- "
echo "srvctl start database -d orcl -eval"
srvctl start database -d orcl -eval
echo "-------------------------------------------- "
echo "srvctl start database -d orcl"
srvctl start database -d orcl
echo "-------------------------------------------- "
echo "srvctl status database -d orcl"
srvctl status database -d orcl
echo "---------------------  End -----------------------------------"

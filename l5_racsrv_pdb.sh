#!/bin/sh
# **********************************************************
# l5_racsrv_pdb.sh
# サービスpdbsrv1の作成と接続確認
# oracleで実行
# *********************************************************

echo "---------------------------------------------------------"
echo "srvctl add service -db orcl -s pdbsrv1 -serverpool srvpool1 -pdb pdb1"
srvctl add service -db orcl -s pdbsrv1 -serverpool srvpool1 -pdb pdb1
echo "---------------------------------------------------------"
echo "srvctl start service -db orcl -s pdbsrv1"
srvctl start service -db orcl -s pdbsrv1
echo "---------------------------------------------------------"
echo "sqlplus sys/Welcome1@scan.oracle.com/pdbsrv1 as sysdba"
sqlplus sys/Welcome1@scan.oracle.com/pdbsrv1 as sysdba <<EOF
set pages 100
col name for a15 
col pdb  for a20
prompt select name,pdb,con_id from v\$services;
select name,pdb,con_id from v\$services;
exit
EOF

echo "---------------------------------------------------------"
echo "srvctl config service -db orcl -s pdbsrv1"
srvctl config service -db orcl -s pdbsrv1
echo "---------------------------------------------------------"
echo "srvctl stop  service -db orcl -s pdbsrv1"
srvctl stop  service -db orcl -s pdbsrv1
echo "---------------------------------------------------------"
echo "srvctl status service -db orcl -s pdbsrv1"
srvctl status service -db orcl -s pdbsrv1
echo "---------------------------------------------------------"
echo "srvctl remove  service -db orcl -s pdbsrv1"
srvctl remove  service -db orcl -s pdbsrv1


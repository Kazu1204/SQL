#!/bin/sh
# **********************************************************
# l6_rebal_1.sh
# 見積もりを実行する
# gridで実行
# ***********************************************************

echo "grid ユーザーで実行してください。gridユーザーならEnterキーを押してください"
read 
echo "sqlplus /nolog" 
sqlplus /nolog <<EOF
prompt connect /as sysasm
connect / as sysasm

prompt EXPLAIN WORK SET STATEMENT_ID='Add Disk' FOR ALTER DISKGROUP DATA ADD DISK '/dev/sdh1';
EXPLAIN WORK SET STATEMENT_ID='Add Disk' FOR ALTER DISKGROUP DATA ADD DISK '/dev/sdh1';

--EXPLAIN WORK SET STATEMENT_ID='Drop Disk' FOR ALTER DISKGROUP DATA DROP DISK DATA_0005;

prompt SELECT EST_WORK FROM V\$ASM_ESTIMATE WHERE STATEMENT_ID='Add Disk';
SELECT EST_WORK FROM V\$ASM_ESTIMATE WHERE STATEMENT_ID='Add Disk';
exit
EOF



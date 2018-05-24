#!/bin/sh
if [ -z "$1" ]
then
  USER=ic_user
else
  USER=$1
fi

sqlplus " / as sysdba"<<EOF
spo proc.txt
set heading off feedback off pagesize 9999 linesize 500 echo on
select 'kill -9 ' || p.spid
from v\$session s, v\$process p
where s.paddr=p.addr
and   s.username=upper('$USER');
spo off
set echo on
exit
EOF

grep \^kill proc.txt > stop.txt
sh stop.txt
rm stop.txt proc.txt

sleep 1
echo "#########################"
echo "#    Clean Up Done !!   #"
echo "#########################"


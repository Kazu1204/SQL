#!/bin/sh

export TAF_DB_NAME=orcl
export TAF_SRV_NAME=taf_srv
export TAF_SRVPOOL_NAME=srvpool1
export TAF_SCAN_NAME=scan.oracle.com

echo "サービス taf_srv を停止します"
echo "srvctl stop service -d ${TAF_DB_NAME} -s ${TAF_SRV_NAME}"
srvctl stop service -d ${TAF_DB_NAME} -s ${TAF_SRV_NAME}

echo "サービス taf_srv を削除します"
echo "srvctl remove service -d ${TAF_DB_NAME} -s ${TAF_SRV_NAME}"
srvctl remove service -d ${TAF_DB_NAME} -s ${TAF_SRV_NAME}

echo "サービス taf_srv を作成します"
echo "srvctl add service -d ${TAF_DB_NAME} -s ${TAF_SRV_NAME} -g ${TAF_SRVPOOL_NAME} -e SELECT -m BASIC -w 1 -z 5"
srvctl add service -d ${TAF_DB_NAME} -s ${TAF_SRV_NAME} -g ${TAF_SRVPOOL_NAME} -e SELECT -m BASIC -w 1 -z 5

echo "サービス taf_srv を開始します"
echo "srvctl start service -d ${TAF_DB_NAME} -s ${TAF_SRV_NAME}"
srvctl start service -d ${TAF_DB_NAME} -s ${TAF_SRV_NAME}

TAF_CONNECT="conn c##taf_user/taf_user@SCANNAME/${TAF_SRV_NAME}"

echo -e "$TAF_CONNECT" | sed -e "s/SCANNAME/${TAF_SCAN_NAME}/g" > ./taf_conn.sql

echo "@taf_user" >> ./taf_conn.sql


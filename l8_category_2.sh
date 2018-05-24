#!/bin/sh
# *************************************************
# l8_category_2.sh
# CategoryとServerpoolを作成
# gridで実行
# ************************************************
echo " gridユーザーで実行します.gridユーザーであればEnterキーを押してください"
read
echo "srvctl remove srvpool -serverpool smallpool"
srvctl remove srvpool -serverpool smallpool
echo "-------------------------------------------------------"
echo "crsctl delete category small_server"
crsctl delete category small_server
echo "-------------------------------------------------------"

echo "crsctl add category small_server -attr "EXPRESSION='(CPU_COUNT < 4)'""
crsctl add category small_server -attr "EXPRESSION='(CPU_COUNT < 4)'"
echo "-------------------------------------------------------"
echo "crsctl status category small_server"
crsctl status category small_server
echo "-------------------------------------------------------"
echo "srvctl add srvpool -serverpool smallpool -category small_server"
srvctl add srvpool -serverpool smallpool -category small_server
echo "-------------------------------------------------------"
echo "srvctl config srvpool -serverpool  smallpool"
srvctl config srvpool -serverpool  smallpool
echo "-------------------------------------------------------"
echo "srvctl status srvpool -serverpool smallpool -detail"
srvctl status srvpool -serverpool smallpool -detail

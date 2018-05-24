#!/bin/sh
# **************************************************
# l8_category_3.sh
# サーバープールのステータス確認
# gridユーザーで実行
# ************************************************

echo "srvctl config srvpool -serverpool  smallpool"
srvctl config srvpool -serverpool  smallpool
echo "srvctl status srvpool -serverpool smallpool -detail"
srvctl status srvpool -serverpool smallpool -detail

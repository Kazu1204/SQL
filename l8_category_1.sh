#!/bin/sh
# ******************************************
# l8_category_1.sh
# CPU情報確認
# gridで実行
# *****************************************
echo "gridユーザーで実行します。gridユーザーであればEnterキーを押してください."
read
echo "cat /proc/cpuinfo | grep processor"
cat /proc/cpuinfo | grep processor
echo "crsctl status server node1 -f| grep CPU_COUNT"
crsctl status server node1 -f| grep CPU_COUNT

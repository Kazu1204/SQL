#!/bin/sh
# *********************************************************
# l6_fasm_1.sh
# Flexasmの稼動状態確認
# gridユーザーで実行
# **********************************************************
echo " gridユーザーで実行してください.gridユーザであればEnterキーを押してください"
read
echo "------------------------------------------------------------"
echo " asmcmd showclustermode"
asmcmd showclustermode

echo "------------------------------------------------------------"
echo "srvctl status asm -detail"
srvctl status asm -detail

echo "------------------------------------------------------------"
echo "crsctl status resource -t -w "NAME co asm""
crsctl status resource -t -w "NAME co asm"



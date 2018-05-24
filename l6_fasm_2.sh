#!/bin/sh
# **********************************************
# l6_fasm_2.sh
# １秒おきにasmリソースを監視(watch)
#  gridで実行
# *********************************************
watch --i 1 'crsctl stat resource -t -w "NAME co asm"'


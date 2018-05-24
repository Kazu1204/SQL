#!/bin/sh
# ***************************************************************
# apacheconfig.sh
# 以下を実行
#    1.apache installに必要なファイルを展開、install
#    2.acfsにディレクトリを作成しコピー
#    3.apacheを./configure
#    4.apacheをmake,make install
#    5.修正済みのhttpd.confをコピー、sample cgiをコピー
# rootで実行する
# ****************************************************************
rm -rf /opt/acfsmount/acfs/httpd-2.4.10
echo "rootユーザーで実行してください。rootユーザであればEnterキーを押してください"
read wait
echo " /opt/acfsmountの権限を変更します..."
chmod -R  777 /opt/acfsmount

echo "/opt/handson/racへ移動します..."
cd /opt/handson/rac

echo "tar -xvfz **.tar.gz"
tar xvfz httpd-2.4.10.tar.gz
tar xvfz apr-1.5.1.tar.gz
tar xvfz apr-util-1.5.3.tar.gz
tar xvfz pcre-8.35.tar.gz

echo "展開したファイルをacfs上[/opt/acfsmount/acfs]にコピーします..."
cp -r httpd-2.4.10 /opt/acfsmount/acfs
cp -Rp apr-1.5.1 httpd-2.4.10/srclib/apr
cp -Rp apr-util-1.5.3 httpd-2.4.10/srclib/apr-util
 
echo "apache用のディレクトリをacfs上に作成します[/opt/acfsmount/acfs/apache]..."
mkdir /opt/acfsmount/acfs/apache
chmod 777 /opt/acfsmount/acfs/apache

echo "pcreをnode1にインストールします..."
#/bin/cp -Rfp /opt/handson/rac/pcre-8.35 /usr/local/src
#cd /usr/local/src/pcre-8.35
#./configure
#make 
#make install

echo " node2で以下を実行してください..."
echo "/bin/cp -Rfp /opt/handson/rac/pcre-8.35 /usr/local/src"
echo "cd /usr/local/src/pcre-8.35"
echo "./configure"
echo "make"
echo "make install"
echo "完了後 Enterキーを押してください..."
read wait


echo "Apacheをインストールします..."
cd /opt/acfsmount/acfs/httpd-2.4.10
./configure --prefix=/opt/acfsmount/acfs/apache
make
make install

echo "編集済のhttpd.confを/opt/acfsmount/acfs/apache/conf/httpd.confにコピーします..."
cp /opt/acfsmount/acfs/apache/conf/httpd.conf /opt/acfsmount/acfs/apache/conf/httpd.conf.handson.backup
/bin/cp -f /opt/handson/rac/httpd.conf /opt/acfsmount/acfs/apache/conf/httpd.conf

echo "サンプルHTML,CGIをコピーします..."
/bin/cp -f /opt/handson/rac/nodename.cgi /opt/acfsmount/acfs/apache/cgi-bin

echo "終了します..."

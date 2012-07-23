--- 
categories: 
  - Ubuntu
comments: true
layout: post
published: true
status: publish
tags: 
  - KBS
  - Ubuntu
title: Ubuntu10.10下安装KBS
type: post
---
假设php5,apache2,ssl等相关包都已通过apt-get的方法安装好，在当前用户下安装。
<div>依赖包包含但不限于如下：</div>
<div># apt-get install automake1.9
# apt-get install php5-dev
# apt-get install libmysqlclient15-dev
# apt-get install sendmail
# apt-get install libesmtp5
# apt-get install byacc
# apt-get install libgmp3-dev
# apt-get install flex
# apt-get install libxml2-dev
# apt-get install libjpeg62-dev
# apt-get install libpng12-dev
# apt-get install libfreetype6-dev
# apt-get install subversion
<div>1、checkout源码</div>
<div>cd ~/bbs</div>
<div>svn co http://svn.kcn.cn/repos/kbs/trunk/</div>
<div>2、修改站点定义信息</div>
<div>cat /etc/passwd | grep <用户名> （查看当前用户的gid和uid）</div>
<div>vi site/fb2k-v2.h （修改相关信息，将BBSUID和BBSGID改为上面看到的内容）</div>
<div>3、配置、编译安装</div>
<div>./autogen.sh</div>
<div>./configure --prefix=/home/bbs --enable-site=fb2k-v2 --with-php --with-mysql --enable-ssh --enable-ssl --with-openssl=/usr --with-libesmtp --enable-innbbsd CFLAGS="-O3 -g" （--prefix为安装目录，--enable-site指定站点信息）</div>
<div>make</div>
<div>sudo make install</div>
<div>sudo make install-home （会清空安装目录下的数据信息）</div>
<div>4、生成密钥</div>
<div>cd /home/bbs/etc</div>
<div>touch sshd_config</div>
<div>ssh-keygen -t rsa1 -f ssh_host_key</div>
<div>5、编辑php.ini</div>
<div>修改 extension_dir="/usr/lib/php5/20090626+lfs/"（php5目录下的类似文件）</div>
<div>增加一行 extension=libphpbbslib.so</div>
<div>将 short_open_tag 的值修改为 Off，magic_quotes_gpc 也应该设置成 Off</div>
<div>将 session.save_path 目录（如 /var/lib/php5/）设置成 bbs 用户可写</div>
<div>6、配置apache2</div>
<div>vi /etc/apache2/apache2.conf （增加一行AddType application/x-httpd-php .php， 把 KeepAlive 参数设为 Off， 建议加入 AddDefaultCharset gb2312）</div>
<div>vi /etc/apache2/envvars （把APACHE_RUN_USER和APACHE_RUN_GROUP的值改为当前用户）</div>
<div>sudo /etc/init.d/apache2 restart （重启apache）</div>
<div>把源码目录www2复制到apache2的DOCUMENT_PATH目录下（/var/www）</div>
<div>7、初始化</div>
<div>cd /home/bbs/bin</div>
<div>./bootstrap</div>
<div>8、运行及停止</div>
<div>编写脚本startbbs，加入如下内容</div>
<div>
<ul>
<li>#!/usr/bin/env sh</li>
    <li>./miscd daemon</li>
    <li>sudo ./bbslogd</li>
    <li>sudo ./bbsd -p 23</li>
    <li>sudo ./sshbbsd -p 22</li>
</ul>
编写脚本stopbbs，加入如下内容

</div>
<div>
<ul>
<li>#!/usr/bin/env sh</li>
    <li>killall sshbbsd</li>
    <li>killall bbsd</li>
    <li>killall bbslogd</li>
    <li>./miscd flush</li>
    <li>killall miscd</li>
</ul>
通过startbbs启动，通过stopbbs停止。启动后通过telnet localhost或者网页访问localhost/<bbs目录>连接服务器

</div>
<div><strong>转信，blog，首页导读等未配置</strong></div>
</div>

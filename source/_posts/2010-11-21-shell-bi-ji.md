--- 
categories: 
  - Ubuntu
comments: true
layout: post
published: true
status: publish
tags: 
  - bash
  - shell
  - Ubuntu
title: Shell笔记
type: post
---
批量删除指定文件（以链接错误文件为例）：

{% codeblock lang:sh %}

file * | grep 'symbolic link in a loop' | sed 's/:.*$//g' | xargs -i rm {}

{% endcodeblock %}

file列出当前文件夹的文件属性，grep过滤文件，sed修改行内容，xargs生成删除指令

批量软链接：

{% codeblock lang:sh %}

file * | grep 'symbolic link in a loop' | sed 's/:.*$//g' | xargs -i rm {}

{% endcodeblock %}




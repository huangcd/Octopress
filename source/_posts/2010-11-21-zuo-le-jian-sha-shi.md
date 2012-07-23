--- 
categories: 
  - Ubuntu
comments: true
layout: post
published: true
status: publish
tags: 
  - Ubuntu
title: 做了件傻事
type: post
---
Ubuntu下改hosts文件的时候把"127.0.0.1 机器名"这行给删了，然后退出以后发现sudo不能用了，每次sudo的时候总会提示

{% codeblock %}
sudo: unable to resolve host 机器名

{% endcodeblock %}

然后由于sudo不能用不能把hosts改回来。。。

幸好在网上搜了一下，发现有个gksudo的东西，与sudo类似功能，不过是GTK+ frontend的，反正就是说和sudo之间没什么联系了，然后就可以把hosts的内容改回来了。

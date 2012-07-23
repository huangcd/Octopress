--- 
categories: 
  - Ubuntu
comments: true
layout: post
published: true
status: publish
tags: 
  - luit
  - telnet
  - Ubuntu
title: "Luit -- locale and ISO 2022 support for Unicode terminals"
type: post
---
事情是这样的，比如想在Ubuntu下telnet上水木，telnet bbs.newsmth.net，然后就会蹭蹭蹭地发现放眼望去，一坨乱码。怎么办呢？
<div>luit出现了，它可以把locale或者ISO 2022的编码转换成Unicode编码，从而在Unicode终端中正常显示，比如用</div>
<div>luit -encoding gbk telnet bbs.newsmth.net</div>
<div>就会发现看到的都是正常人能看明白的东西了。</div>
<div>当然luit的作用也不仅限telnet上水木了，比如cat gbk编码的文件的时候也可以在前面加luit。</div>

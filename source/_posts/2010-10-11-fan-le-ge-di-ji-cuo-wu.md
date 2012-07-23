--- 
categories: 
  - Java
comments: true
layout: post
published: true
status: publish
tags: 
  - Java
  - regex
title: 犯了个低级错误
type: post
---
n久不用Java了，今天刷SPOJ发现有道水题（好吧，其实题目虽然很水，但有个变态要求：不能用分号“;”，所以Java实际是做不了的，不过一开始没看见。。。）只能用Java/C/C++而且又可以正则匹配。然后开始噌噌噌噌地开始Java各种Pattern、Matcher。不料写完以后总是No Match Find。但是相同的表达式用Python和Kiki都没问题，调了n久以后无意中加了一句System.out.println(mat.matches());，居然可以了。。。

于是想起凡事要先matches才能group

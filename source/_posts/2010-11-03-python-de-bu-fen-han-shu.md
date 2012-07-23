--- 
categories: 
  - Python
comments: true
layout: post
published: true
status: publish
tags: 
  - "partial function"
  - Python
title: Python的部分函数
type: post
---
Haskell原生支持部分函数（这么说也不准确，Haskell本来一个函数就最多只能有一个参数，多参数函数只是多个函数组合的一种简化形式），然后今天发现其实Python里面也是有部分函数的，就是functools包里面的partial函数了，partial函数的第一个参数是一个函数，后面是这个函数的参数，然后返回一个新的函数，这个函数就是原来的函数中相应的参数被替换为常量的一个函数了。

。。。描述能力堪忧

--- 
categories: 
  - Programming
comments: true
layout: post
published: true
status: publish
tags: []
title: 还是今天的事情
type: post
---
早上看了一下那篇所谓的Model Checking on python和eXplode，发现是挂着Model checking的狗头卖autoamted-testing的羊肉。跟我要做的东西完全不沾边。。。不过eXplode里面有提到几个implementation-level model checking的文章，主要是Java和C的。估计看看能有点收获。

中午跟William通了个电话。他也是觉得裸写BLAST Algorithm工作量确实有点大，所以最好还是能够再找找其他工具看看能不能凑活一下，他提了几个，我也找了几个，计有SLAM、CBMC、SPIN等等，明天逐一试试看看靠不靠谱。今天先简单试了一下，SPIN貌似不是针对C的，估计不行；CBMC挺好，但是循环处理很不给力；SLAM微软出品，不抱什么希望。。。

抛开这些东西不说吧，其实回到最根本的问题，William想证的是python code和数学方程的等价性，这个就是我一直不知道怎么证的。说可以写invariant来保证，但invariant怎么写呢？真是一大堆头疼的问题。

总的来说今天很不给力。

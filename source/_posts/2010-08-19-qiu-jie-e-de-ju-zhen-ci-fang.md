--- 
categories: 
  - Python
comments: true
layout: post
published: true
status: publish
tags: 
  - Python
title: 求解e的矩阵次方
type: post
---
找了一下，貌似numpy库没有这个函数，自己写了一个


{% codeblock %}


#!/usr/bin/env python
# -*- coding: UTF-8 -*-
from numpy import *
def pow_e(A, err = 1E-5):
'''e的A次方，A为矩阵'''
idx = 1
fact = 1
result = A ** 0
while True:
T = (A ** idx) / fact
idx += 1
fact *= idx
sumT = sum(map(lambda l: sum(map(long, map(abs, l))), T.tolist()))
if sumT > 10E10:
raise Exception('power is too large')
if sumT <= err:
break
result += T
return result


{% endcodeblock %}
 

--- 
categories: 
  - Python
comments: true
layout: post
published: true
status: publish
tags: 
  - Python
title: 计算一个32位整数的二进制表示末尾0的个数
type: post
---
{% codeblock lang:python %}
# -*- coding: utf-8 -*-
"""
计算一个32位整数的二进制表示末尾0的个数
Created on Wed Dec 15 09:18:27 2010
@author: HUANGCD
"""
multiply_De_Bruijn_position = [
        0, 1, 28, 2, 29, 14, 24, 3, 30, 22, 20, 15, 25, 17, 4, 8,
        31, 27, 13, 23, 21, 19, 16, 7, 26, 12, 18, 6, 11, 5, 10, 9]

def tail_zero_count(num):
    return multiply_De_Bruijn_position[(((num & (-num)) * 0x077CB531) >> 27) & 31]

if __name__ == '__main__':
    print tail_zero_count(0x110000000)

{% endcodeblock %}

<a href="http://graphics.stanford.edu/~seander/bithacks.html" target="_blank">这里</a>可以围观到各种位运算的技巧

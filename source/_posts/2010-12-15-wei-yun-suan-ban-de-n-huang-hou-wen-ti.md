--- 
categories: 
  - Python
comments: true
layout: post
published: true
status: publish
tags: 
  - Python
  - 八皇后
title: 位运算版的n皇后问题
type: post
---
{% codeblock lang:python %}

# -*- coding: utf-8 -*-
"""
n皇后问题位运算版
Created on Wed Dec 15 08:39:27 2010
@author: HUANGCD
"""
def queen(row, ld, rd, upper_limit, result):
'''
@param row   列上的限制，0为允许，1为不允许
@param ld    左上到右下的对角线限制
@param rd    右上到左下的对角线限制
@param upper_limit   n （设定的值为(1 << n) - 1）
@param result  返回的结果
'''
    if row ^ upper_limit:
        pos = upper_limit & ~(row | ld | rd)
        while pos:
            p = pos & (-pos)
            pos = pos - p
            result = queen(row | p, (ld | p) <> 1, upper_limit, result)
    else:
        result += 1
    return result

if __name__ == '__main__':
    import time
    time.clock()
    print queen(0, 0, 0, (1 << 13) - 1, 0) 
    print time.clock()

{% endcodeblock %}

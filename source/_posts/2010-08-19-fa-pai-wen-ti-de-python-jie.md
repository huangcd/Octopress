--- 
categories: 
  - Python
comments: true
layout: post
published: true
status: publish
tags: 
  - Python
title: 发牌问题的Python解
type: post
---
<a href="http://www.javaeye.com/topic/739731" target="_self">原帖在此</a>（有52张扑克牌要随机发牌给四个玩家，并且四个玩家牌的数量是相同的？）

google了一下，发现Python也可以一行写完，不过需要用到izip_longest和random两个函数。代码如下：

{% codeblock lang:python %}

from itertools import izip_longest

from random import random

list(izip_longest(*[iter(sorted(range(1, 53), key=lambda x: random()))]*13))

{% endcodeblock %}
 

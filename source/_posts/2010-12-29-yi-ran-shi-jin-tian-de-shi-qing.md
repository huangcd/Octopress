--- 
categories: 
  - Programming
comments: true
layout: post
published: true
status: publish
tags: 
  - Lego
title: 依然是今天的事情
type: post
---
宋老师说William做事很快，果然是很快。今天看了一个工具以后把我的看法给他发过去，顺便提了一下等价性证明无从下手的问题。过了不大一会他就打电话过来详细了解了Lego小车的模型，然后指出了现在的系统实际上应该是有两层的控制器在工作，high level是我写的pid控制器，low level是Lego本身的一个控制系统，就像卫星一样（说得好像很高级的样子，赞～），我们之前的验证其实都是在high level上面做的，low level里面的事情还没说清楚。所以我最好能把这个事情给弄明白。

然后下午又开始搬出尘封已久的Lego小车。试了一下，发现代码几个月不用，大概是生锈了，跑起来各种不给力，效果很不好，还原因不明。想想还是先专心看看low level实现比较靠谱，看了一下Motor那块，发现其实真没做什么事情，无非就是把速度等比例转换成马达的功率，然后稍微做了点调整。。。

忘了说个号外，今天看到一个很给力的哥们，用Lego和纸杯了个留声机。<a href="http://www.josepino.com/lego/ntx-gramophone">这里</a>可以围观。亮点是最后一句的粗体。。。

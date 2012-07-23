--- 
categories: 
  - PLC
  - Webkit
  - 流水笔记
comments: true
layout: post
published: true
status: publish
tags: 
  - 社会主义与当代中国
  - 考试
  - PLC
  - WebKit
title: 2010.4.26 PLC、WebKit、社当考试
type: post
---
首先详细分析一下SIMATIC 300(1)的代码（不写点东西的话总容易分神。。。）
显然是先从OB1开始的了，OB1就是俗称的"Main Program Sweep (Cycle)"
首先Call的是StationSendPC函数，也就是FC13（内含DB2--PCRev），学名是
{% codeblock %}
” 从站设备原始数据传入DB2“
{% endcodeblock %}


{% codeblock %}
” 从站设备原始数据传入DB2“
{% endcodeblock %}



{% codeblock %}
” 从站设备原始数据传入DB2“
{% endcodeblock %}


[code]
AN I 16.0
= DBX 144.0
[/code]

的结构，<strong>但AN是和上一个RLO and not，似乎就是每一个AN都是和上一个类似代码段的RLO and not一下，也就是说结果是逐个依赖的样子（我说的是什么呢？？？）</strong>。
(号外——补充一个注释：LAR1 P#M100.0 //Load AR1 with a 32-bit pointer constant.)
然后是泵运行状态，代码如下：

[code]
L P#20.0 //取基址
LAR1
L P#162.0
LAR2
L 11
Lop1: NOP 0
T #TmpNum
A I [AR1,P#0.0]
= DBX [AR2,P#0.0]
AN I [AR1,P#0.0]
= DBX [AR2,P#0.1]
+AR1 P#0.2 //输入间隔2
+AR2 P#1.0 //数据块间隔1字节
L #TmpNum
LOOP Lop1
[/code]

好吧，其实我<em><strong>没看懂</strong></em>，所以直接贴上来。。。




{% codeblock %}
” 从站设备原始数据传入DB2“
{% endcodeblock %}

{% codeblock %}
” 从站设备原始数据传入DB2“
{% endcodeblock %}

{% codeblock %}
” 从站设备原始数据传入DB2“
{% endcodeblock %}

{% codeblock %}
” 从站设备原始数据传入DB2“
{% endcodeblock %}


{% codeblock %}

{% codeblock %}
” 从站设备原始数据传入DB2“
{% endcodeblock %}

{% endcodeblock %}


{% codeblock %}
” 从站设备原始数据传入DB2“
{% endcodeblock %}



{% codeblock %}
” 从站设备原始数据传入DB2“
{% endcodeblock %}



{% codeblock %}
” 从站设备原始数据传入DB2“
{% endcodeblock %}



{% codeblock %}
” 从站设备原始数据传入DB2“
{% endcodeblock %}
Web Template Framework, 它provides commonly used functions all over the WebKit codebase.
然后检查发现FrameLoader似乎是整个WebCore的入口，外壳（GTK、QT、Chrome等等）就是调用FrameLoader来载入网页 的，然后FrameLoader目前有一个问题，就是载入网页的时候需要一个外壳（这依赖太纠结了。。。），FrameLoader有几个看起来很 kernel的函数，首先是createWindows，就是新建一个窗口（标签页）的时候调用的吧。然后是各种load，就是载入URL了。

暂时就看了这么多。。。

下午考试，社会主义与当代中国，太纠结了。10道论述题，每道题都是写着歇着突然发现“咦，好像问的不是这个”，怎么办？划掉重写？太浪费时间了。。。试 图转回来？要能转回来就不会写错了。。。然后就像“算了，反正老师未必会看，看了也未必知道我在说什么，知道也可能会同情我写了那么多字”，反正大概应该 可能也许不会挂就是了，然后就开始写下一题了。

晚上突然发现最近几周都忘了下Mentalist，我就说怎么总觉得少看了一部美剧，但具体有想不起来，Lie To Me已经停播，Chuck好像出的话基本都下了，然后今天终于想起是Mentalist，一搜，居然差3集没看，真是哇哈哈哈哈哈哈哈哈哈哈哈


{% codeblock %}
” 从站设备原始数据传入DB2“
{% endcodeblock %}



{% codeblock %}
” 从站设备原始数据传入DB2“
{% endcodeblock %}

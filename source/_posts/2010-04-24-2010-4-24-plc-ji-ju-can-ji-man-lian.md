--- 
categories: 
  - PLC
  - 流水笔记
comments: true
layout: post
published: true
status: publish
tags: []
title: "2010.4.24 PLC及聚餐及曼联"
type: post
---
历经千辛万苦，终于把SIMATIC（为什么那么像赛门铁克呢？？？）里面的源码弄出来了。不得不说 Vim除了适合显摆以外，功能还是异常强大的，尽管现在还只是略懂，不过已经足以完成大部分文本处理的任务了。遗憾的是:%s/{pattern} /{substring}/g全局替换似乎不能用中文（<strong>或者更准确的说，VIM在命令状态下不能输入中文，有机会要尝试解决一下</strong>）。

继续补充昨天内容：
<ul>
<li>PI原来是Process Input的意思（ABB变频器和S7-300DP通讯里面说到——《设计文档（简略）》，PS.似乎找不到传说中的SFC15，只有SFC20和 SFC14）。因此据猜测，PIW应该是Process Input Word的意思了吧。</li>
    <li>还有什么DBX 145.0这样的东西就是对应于当前打开的那个DB（OPN XXX中的XXX）中的第145.0（实际上应该就是145个位）。因为在《设计文档（简略）》中有这么一句</li>
</ul>
[code]
RECORD :=P#DB20.DBX 6.0 BYTE 6
[/code]


说的似乎是从DB20中第6位开始读6个BYTE
<ul>
<li>OB其实是Organization Block的意思。</li>
    <li>DB自然就是Data Block了</li>
    <li>FC指的是Function</li>
    <li>FB是Function Block（跟FC有什么区别呢？？？）</li>
    <li>SFC是System Function</li>
    <li>VAT是Variable Table，储存各种各样的变量。如下图（程序中各种各样的"PCSend".PCSend[2]）这种要你命三 千的含义都能从这里查到（说起来，DBX是不是任意位数呢？类似DBW、DBB）<a href="http://huangcd.files.wordpress.com/2010/04/2010-4-24-plce58f8ae8819ae9a490e58f8ae69bbce88194.png"><img class="alignnone size-full wp-image-10" title="2010 4 24 plce58f8ae8819ae9a490e58f8ae69bbce88194" src="http://huangcd.files.wordpress.com/2010/04/2010-4-24-plce58f8ae8819ae9a490e58f8ae69bbce88194.png" alt="" width="401" height="401"></a>
</li>
</ul>
另外赞一下VirtualBox的无缝模式，个人感觉完胜VirtualPC（没用过。。。）、VMWare（没用过最新版。。。）两个收费版

中午聚餐，计有LMY、LHD、XQ、LZJ、CKY、LWJ和我共七人于江湖味道（为什么二楼看起来挺高雅的，一楼却怎么看都像大排档呢，搞到我被大家 狂喷），价格便宜量又足，还是不错的。席间爆料说我曾经发过暧昧短信。。。我怎么不记得了
席间诸位工作了的同仁都无甚八卦热情，更多的是讨论租房等现实问题。我和LZJ两位烟酒僧对角默坐，无言以对，很是悲凉。

晚上突然发现新浪有曼联直播，还是曼联VS热刺这种重头戏，显然是要看的。不过新浪视频居然只支持IE，只支持IE也就忍了，居然一开就把带宽全占了，网 都上不了。不过尽管如此，我还是排除万难，坚持看完全场，并在看直播过程中成功吧SIMATIC代码导出来。
鉴于曼联赢了，心情甚好，点评一下：
<ol>
<li>潇洒哥真不潇洒</li>
    <li>小马哥很牛，上场就来个助攻，虽然只是捣了个脚</li>
    <li>nani似乎没以前那么喜欢突突突了，表现还是可以的</li>
    <li>Bale真牛，曼联当年没搞到手浪费了</li>
    <li>王老吉同志很好，梅开二度</li>
    <li>卡里克挺好的一个同志，怎么就成隐身卡了。。。</li>
    <li>鲁小胖的小孩感觉怎么那么胖呢</li>
    <li>他池为了马竞，似乎不会给面子了</li>
</ol>
OVER，开始看片

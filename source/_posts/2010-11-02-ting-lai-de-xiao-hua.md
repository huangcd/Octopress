--- 
categories: 
  - 流水笔记
comments: true
layout: post
published: true
status: publish
tags: 
  - C语言
  - 笑话
title: 听来的笑话
type: post
---
发信人: *****************, 信区: CProgramming
标  题: EOF是什么
发信站: 水木社区 (Tue Nov  2 00:28:43 2010), 站内

#include

// copy the input char to the output

main()
{
int c;

c = getchar();
while (c != EOF) {
putchar(c);
c = getchar();
}
}

mac os x系统下编译：cc 编译后运行
输入：EOF
输出：EOF
为什么不是退出程序啊？
现在只能用ctrl+c退出
谢谢！

--

※ 来源:·水木社区 newsmth.net·[FROM: 59.66.200.*]

<hr>好吧，这个一般搞笑，更搞笑的在下面

<hr>发信人: ****************************, 信区: CProgramming
标  题: Re: EOF是什么
发信站: 水木社区 (Tue Nov  2 09:23:16 2010), 站内

输入end of file or END OF FILE 还是不行啊
到底输什么能结束啊？


【 在 shocker ((^o^)/~) 的大作中提到: 】
: EOF 是end of file 的缩写，你在屏幕上输入的话不能直接用缩写，要全部输入。
: 你再试试吧。


--

※ 来源:·水木社区 newsmth.net·[FROM: 59.66.200.*] 

--- 
categories: []
comments: true
layout: post
published: true
status: publish
tags: 
  - C++
  - virtual
title: C++中的虚函数
type: post
---
直接上代码

[code]

#include &lt;iostream&gt;
#include &lt;stdlib.h&gt;
using namespace std;

class Base {
public:
virtual void virtualFunc() { cout &lt;&lt; &quot;BaseVirtualFunc&quot; &lt;&lt; endl; }
void func() { cout &lt;&lt; &quot;BaseFunc&quot; &lt;&lt; endl; }
void call() { virtualFunc(); func(); }
};

class Derive : public Base {
public:
void virtualFunc() { cout &lt;&lt; &quot;SubClassVirtualFunc&quot; &lt;&lt; endl; }
void func() { cout &lt;&lt; &quot;SubClassFunc&quot; &lt;&lt; endl; }
};

int main(int argc, char *argv[])
{
Derive d;
d.call();
/*-------------------------output-------------------------*/
/*SubClassVirtualFunc                                     */
/*BaseFunc                                                */
/*--------------------------------------------------------*/
system(&quot;PAUSE&quot;);
}

[/code]

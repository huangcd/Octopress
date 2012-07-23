--- 
categories: 
  - Haskell
comments: true
layout: post
published: true
status: publish
tags: 
  - Haskell
  - 函数式编程
title: Haskell中的CPS
type: post
---
CPS(Continuation Passing Style)。恩，还不太明白，不过感觉异常强大。简单地说，就是把一个函数（比如说f）作为另一个函数的参数实现迭代，函数作为参数很正常，然而神奇的是CPS中的这个f每次迭代时都不一样，比如说第一次的时候可能是(x -> []），然而第二次的时候可能就变成了(x -> x:[]) 了，这样想起来似乎就有点像Python中的yield了。

比如一个cps的实例是：

<strong><span style="color:#0000ff;">cps :: (a -> b -> (b -> b) -> b) -> b -> [a] -> b
cps f z [] = z
cps f z (x:xs) = f x z (y -> cps f y xs)</span></strong>

然后就可以利用这个cps来重新定义一些常用函数了：

<strong><span style="color:#0000ff;">myMap func l = cps (a bl h -> (func a): (h bl)) [] l</span></strong>

<strong><span style="color:#0000ff;">myFold func z l = cps (a bl h -> func x (h bl)) z l</span></strong>

<span style="color:#888888;">这个myFold似乎和foldr不一样，理解错误。。。</span><strong><span style="color:#0000ff;">
</span></strong>

<strong><span style="color:#0000ff;">myFilter func l = cps (a bl h -> if func a then a: (h bl) else h bl) [] l</span></strong>

这两个函数就map、foldr和filter的实现了，这里面的函数h就是神奇所在了，对应来看，下面三个函数的lambda表达式就是cps中的f，因此h就是(y -> cps f y xs)这个函数，这是一个包含cps的lambda表达式，也就是说每次调用这个函数的时候它都要调用cps来产生一个新的函数。什么时候中止呢，就是当xs==[]的时候了，这时h是这样一个函数t -> []，然后依次把h代入计算，直到最后得到结果。

恩，虽然说起来貌似异常powerful的样子，但好像也没有什么很特别的用处，无非就是一个yield。

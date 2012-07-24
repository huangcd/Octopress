---
layout: post
title: "函数式C#的尝试"
date: 2012-07-18 07:20
comments: true
categories: [functional, Csharp, lambda]
author: huangcd
---

由于工作的需要，最近需要大量使用MS系的产品，Visual Studio和C#首当其冲（吐槽一下，Visual Studio的快捷键和Intelligence太弱了，好不容易有个ReSharper还是收费的。。。）

不得不说，几年不见，C#跟以前长得都不一样了。我印象中的C#基本上是Java的翻版，现在一看，我勒个去，各种lambda、LINQ满天飞。。。

<!--more-->

lambda是我喜欢的，作为一个低级的Haskell爱好者和Python的中度用户，lambda表达式为链式处理带来的快捷体验是无可比拟的，Python的map、reduce、filter这些函数式方法以及Generator Expression是谁用谁知道啊。

粗略看了一下C#，发现居然没有map、reduce、filter几个函数，深感无力，决定自己轮子一下：

``` csharp functional C#
public static IEnumerable<TResult> Map<TSource, TResult>
    (IEnumerable<TSource> sources, Converter<TSource, TResult> converter)
{
    foreach (var source in sources)
    {
        yield return converter(source);
    }
}

public static IEnumerable<TItem> Filter<TItem>
    (IEnumerable<TItem> sources, Predicate<TItem> predicater)
{
    foreach (var item in sources)
    {
        if (predicater(item))
        {
            yield return item;
        }
    }
}

public delegate TResult Accumulator<in TSource, TResult>
    (TSource source, TResult result);

public static TResult Reduce<TSource, TResult>
    (IEnumerable<TSource> sources, TResult initValue, 
     Accumulator<TSource, TResult> accumulator)
{
    foreach (var source in sources)
    {
        initValue = accumulator(source, initValue);
    }
    return initValue;
}
```

写完之后就深深地被自己的函数式功底折服了~尤其是这Reduce函数，还可以生成Filter和Map两个函数，实在是太给力了。。。

然后开始看LINQ，看着看着觉得不怎么妥。。咦，Filter不就是where嘛，Map不就是Select嘛。。。原来我想要的，别人早就想好了，不过还好Reduce这么高阶的函数是LINQ做不到的，想来又深以为然~

然后装了ReSharper（插播一下，ReSharper真的可以让Visual Studio好用一万倍啊一万倍），猛然又发现，ReShaper函数上直接提示说这个可以换成LINQ表达式！我勒个去，Ctrl+Enter之后果然把Reduce函数变成了这个样子：

``` csharp
return sources.Aggregate(initValue, (current, source) => accumulator(source, current));
```

于是我就不能忍了，直接上.NET Reflector看源码，发现Aggregate、Select、Where几个函数长得基本和我写得差不多，总算舒服一点。。。

总的来说，C#还是不错的，从语言的层面上来说已经完全超越Java了，除了各种库少一点，用的人少一点之外基本上没什么问题了。

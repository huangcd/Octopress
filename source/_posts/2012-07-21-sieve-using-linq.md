---
layout: post
title: "使用LINQ表达式来求素数"
date: 2012-07-21 12:03
comments: true
categories: [LINQ, Csharp]
---

不得不说，这是相当无聊的问题，用LINQ来做Sieve，不仅效率低，而且可读性差，因此纯粹是练习LINQ。。

同样不得不说的是，Aggregate函数（也就是一般意义上的reduce函数）确实异常强大。。

{% codeblock sieve in LINQ lang:csharp %}
public IEnumerable<int> GetPrimesUsingLinq(int maxValue)
{
    return Enumerable.Range(2, maxValue - 1).Aggregate(
        Enumerable.Range(0, maxValue + 1).ToList(),
        (sieve, x) =>
        {
            if (sieve[x] > 0)
            {
                Enumerable.Range(2, maxValue / x - 1).Select(i => i * x).Aggregate(sieve, (s, i) => { s[i] = 0; return s; });
            }
            return sieve;
        },
        x => x.Where(i => i > 1)
    );
}
{% endcodeblock %}
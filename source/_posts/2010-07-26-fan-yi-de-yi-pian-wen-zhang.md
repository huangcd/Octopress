--- 
categories: 
  - Python
comments: true
layout: post
published: true
status: publish
tags: 
  - Python
title: 翻译的一篇文章
type: post
---
一篇关于Python速度的文章，感觉写的还是不错的。一时兴起，就翻译了一下，不过翻译水平自然是很差了，所以看不懂的话就看<a href="http://wiki.python.org/moin/PythonSpeed" target="_blank">原文</a>吧

<!--style-start -->
<h2>Python的速度</h2>
经常会有很多人担心Python写的程序会存在性能上的问题。是不是说使用Python就意味着性能上会有不可接受的损失呢？一些人会往往会不假思索地给出结论：“Python是解释性的脚本语言啊，解释性脚本语言都是非常慢的！”然而另外一些人经过实际测试以后发现Python其实并不慢。当然，某些时候可能是因为你恰好有一个跑的非常慢的程序。
<h2>速度对于程序来说是不是重要吗？</h2>
有些人可能会盲目地追求所谓的速度；在他们看来，像C这样的语言在很多场景下能够提供更好的运行速度，所以他们会觉得不管什么场合C都是一个更好的选择。但是另外一些人可能会觉得开发速度才是更重要的，所以即便实在那些Python运行效率不那么高的应用里面，他们还是会选择Python。而且这些人往往也会惊奇地发现Python代码的执行速度还是可以接受的，甚至某些时候在开发时间差不多的情况下Python的代码甚至会比C/C++要来的快（<span style="font-size:x-small;">译者：本来还觉得挺好的，这么一说就没什么意思了。。。</span>）。

通常来说，绝对的速度并不是最重要的，你应该考虑的是一个可接受的执行速度。优化地太多反而是对资源（你的时间或者金钱）的一种浪费。
<h2>提高性能和可伸缩性的技术</h2>
下面是一些提高内存使用、速度和可扩展性等方面性能的编码原则：
<h3>使用更好的算法或者更快的工具</h3>
<ul>
<li>测试从属关系的时候，使用set和dictionary（O(1)的时间复杂度）比普通序列（O(n)的时间复杂度）要快得多。比如说对于“a in  b”这样的语句，b应该是set或者dictionary，而不是list或者tuple。</li>
    <li>字符串连接用''.join(seq) 的方式会更好（O(n)的过程）。相反，如果使用“+”或者“+=”操作符的话复杂度是O(n^2)的，因为在这个过程中的每一步都要生成一个新的字符串。CPython  2.4翻译器在一定程度上优化了这个过程，但是''.join(seq) 仍然是最好的方式。</li>
    <li>很多工具都有链表（list）形式或者迭代器（iterator）形式（range和xrange，map和itertools.imap，<a href="http://www.python.org/dev/peps/pep-0202/">list  comprehensions</a>和<a href="http://www.python.org/dev/peps/pep-0289/">generator expressions</a>，dict.items和dict.iteritems）。一般情况下，迭代器形式对内存要求更低而且有更多的可伸缩性。如果并不需要一个真正的list的话，迭代器形式是一个更好的选择。</li>
    <li>很多核心模块都是用优化过的C来写的。利用这些模块可以让程序性能有很大的提升。这些模块包括所有的内置数据类型（list，tuple，set和dictionary）和像array、itertools、collections.deque这样的扩展模块。</li>
    <li>类似的，内置函数也会比手工构建的函数要快，比如map(operator.add,  v1, v2)就比map(lambda x,y: x+y, v1, v2)快。</li>
    <li>list结构在处理定长数组或者变长的栈的时候效率较高。然而当涉及到队列的pop操作或者插入操作的时候，使用collections.deque()更好，因为它避免了每次插入或者删除的时候需要重建数组的过程，所以它的时间复杂度将由O(n)提高到O(1)。</li>
    <li>自定义排序的时候，使用Python2.4的key=或者传统的修饰器效率更高，因为它们的实现只需要对每个元素调用一次key函数。而不像cmp=那样每个元素都要调用很多次。比如sort(key=str.lower) 要比sort(cmp=lambda a,b: cmp(a.lower(),  b.lower()))快。另见<a href="http://wiki.python.org/moin/TimeComplexity"><span style="color:#0000aa;">TimeComplexity</span></a>。</li>
</ul>
<h3>利用解释器优化</h3>
<ul>
<li>在函数里面，局部变量的访问速度要比全局变量、内置数据和属性查找快。所以有时候在内部循环里面把变量局部化是值得的。 比如random.shuffle()函数使用了random=self.random进行局部化，节省了每次循环都要查表（在self中查找random）的过程。当然在循环外部这样做的话就不太值得了。</li>
    <li>上一个建议是一个把常量表达式提出循环的通用规则。类似地，常量的展开也应该手工地做，比如说在循环里面应该把x=1+2替换成x=3。</li>
    <li>函数调用开销要比其他的操作大。因此有时候应该在一些关键的循环里面应该把函数内联(inline)。</li>
    <li>
<a href="http://www.python.org/dev/peps/pep-0202/">list comprehensions</a>要比for循环稍微快一点（除非你不想要结果）。</li>
    <li>从Python2.3开始，解释器对while  1进行了优化，相比起while  True而言，它在循环判断的时候只有一次跳转。因此在一些关键的场景下可以使用while  1来替代while True，虽然这有可能会降低程序的可读性。</li>
    <li>混合赋值（x, y=a, b）比独立赋值要慢（x = a; y = b）。当然，通过混合赋值来交换（x, y=y, x）还是通过临时变量交换（t = x;  x = y; y = t）要快。</li>
    <li>链式比较比用and操作符要快，因此应该把x < y and y < z写成x < y <  z。</li>
    <li>另外还有一些快速的实现应该只在最需要的程序里面使用。比如果用not not  x会比bool(x)快。</li>
</ul>
<h3>利用诊断工具</h3>
<ul>
<li>hotshot和profile模块可以用来定位性能瓶颈所在，profile工具还能识别消耗在Python代码上的时间和消耗在C代码上的时间。</li>
    <li>timeit模块提供一个分析不同实现的及时的性能比较的工具。</li>
</ul>
<h3>程序性能也受到一些全局策略的影响</h3>
<ul>
<li>在解析XML文本的时候，相对DOM方法而言，SAX更快，而且内存效率更高。</li>
    <li>更多地使用C版本的模块也会提高程序性能，比如用cPickle来替代pickle模块，用cStringIO来替代StringIO。当然也要意识到一般而言C版本的模块可能会缺乏灵活性。</li>
    <li>在一些I/O读取较多的场合使用线程可以加快响应时间。</li>
    <li>select模块可以帮助我们最小化从多个socket抓取数据的开销。</li>
</ul>
<h3>考虑使用额外的工具来提高性能</h3>
<ul>
<li>对于大规模的数值计算而言，numpy更有效率。</li>
    <li>psyco和pyrex能够加速本地代码。然而也要注意它们的一些限制，比如说并不支持所有的构造器。</li>
    <li>See the <a href="http://wiki.python.org/moin/SciPy"><span style="color:#0000aa;">SciPy</span></a>-related document <a href="http://scipy.org/PerformancePython"><span style="color:#0000aa;">"A beginners guide  to using Python for performance computing"</span></a> for an interesting  comparison of different tools, along with some timing results.</li>
</ul>
<h2>更多地性能提示</h2>
可以在<a href="http://wiki.python.org/moin/PythonSpeed/PerformanceTips"><span style="color:#0000aa;">PythonSpeed/PerformanceTips</span></a>一文中找到更多的提升性能的技巧和例子。

--- 
categories: 
  - Python
comments: true
layout: post
published: true
status: publish
tags: 
  - Python
title: "Python的Import site错误解决方法"
type: post
---
在运行Python程序的时候可能会遇到'import site' failed; use -v for traceback的信息，但出现这个错误以后程序还可以运行，只不过后面如果在import某些库的话就会出现ImportError No module name XXX的信息，然后程序就真正死了。
<div>网上搜了很多后没有解决方法，后来一想，import site不就是说有一个site.py的文件咩，然后在Python安装目录下find一下，果然有两个site.py文件，一个在%PYTHON_HOME%/Lib目录下，一个在%PYTHON_HOME%/Lib/site-packages目录下，分别看了一下内容，发现%PYTHON_HOME%/Lib目录下的site.py比较靠谱，前面几行是这样写的：</div>
<div>Append module search paths for third-party packages to sys.path.</div>
<div>****************************************************************</div>
<div>* This module is automatically imported during initialization. *</div>
<div>****************************************************************</div>
<div>In earlier versions of Python (up to 1.5a3), scripts or modules that</div>
<div>needed to use site-specific modules would place ``import site''</div>
<div>somewhere near the top of their code.  Because of the automatic</div>
<div>import, this is no longer necessary (but code that does it still</div>
<div>works).</div>
<div>可见应该就是它了，然后看了一下环境变量，果然%PATH%中没有%PYTHON_HOME%/Lib，把这个目录加到%PATH%中去，再次运行程序就好了。</div>

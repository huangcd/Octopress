---
layout: post
title: "使用Octopress在github搭建博客"
date: 2012-07-19 16:48
comments: true
categories: [Octopress, github, blog]
author: huangcd
---

+  使用[rubyInstaller](http://rubyforge.org/frs/download.php/75127/rubyinstaller-1.9.2-p290.exe)安装ruby1.9.2
+  使用[msysgit](http://code.google.com/p/msysgit/downloads/list)安装git
+  按照[教程](https://github.com/oneclick/rubyinstaller/wiki/development-kit)安装[development-kit](https://github.com/downloads/oneclick/rubyinstaller/DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe)
+  在命令行下执行下面代码
{% codeblock gem install lang:sh %}
git clone git://github.com/imathis/octopress.git octopress
cd octopress
gem install bundler
bundle install
{% endcodeblock %}
安装过程中可能会遇到一些问题，自行google之。
{% codeblock gem source lang:sh %}
gem sources --remove http://rubygems.org/
gem sources -a http://ruby.taobao.org/
{% endcodeblock %}
如果gem install的速度比较慢，可以把gem的源换成taobao的。

+  在github创建一个名字为[userName].github.com的项目，然后根据[help](https://help.github.com/)的内容进行配置。
+  执行下面代码
{% codeblock setup and deploy %}
rake setup_github_pages
rake generate
rake deploy
{% endcodeblock %}

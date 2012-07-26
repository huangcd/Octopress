---
layout: post
title: "Sublime Text 2各种插件及使用方法"
date: 2012-07-25 17:32
comments: true
categories: 
    - sublime text
---

## SublimeCodeIntel
支持N多语言的Intelligence。主要提供几个功能。

+   定义跳转（光标在标示符上的时候按``ctrl+F3``或者``alt+鼠标左键``
+   自动补全（写的时候会自动出来，如果没有自动出来可以按``ctrl+j``强制弹出(貌似没有效果)）

### 配置
可以配置外部库的路径，具体参考自带文档。。。

## Pylinter
Python代码的动态检查（主要是语法和格式层面的），打开py文件就会自动运行。有错误/警告的地方会用方框框住，光标移到方框里面的时候会在状态栏支出错误/警告的内容。有几个快捷键``ctrl+alt+x``、``ctrl+alt+z``、``ctrl+alt+c``，不够实测都没什么用。。。

### 配置
Pylinter依赖python的pylint包，运行前需要修改目录下的Pylinter.sublime-settings的文件。设置pylint_path变量，指定pylint的位置。

## Sublime Alignment

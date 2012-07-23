--- 
categories: 
    - python
    - transparent
    - image
comments: true
layout: post
published: true
status: publish
tags: []
title: Python创建透明PNG图片
type: post
---
有两点需要注意的，一个是图片只有在保存成PNG格式之后 才会透明，另一个是颜色只能用"#FF00FF"这种格式，而不能用0XFF00FF（即只能 是字符串，否则不透明，很诡异）

1 import Image, ImageFont, ImageDraw
2
3 im = Image.new('RGBA', (120, 50), (0, 0, 0, 0))
4 dr = ImageDraw.Draw(im)
5 font = ImageFont.truetype('MONACO.TTF', 30)
6 dr.text((10, 10), 'hello', font = font, fill = '#00FF00')
7 im.save('test.png', 'PNG')

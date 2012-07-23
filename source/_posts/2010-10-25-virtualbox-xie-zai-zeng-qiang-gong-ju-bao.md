--- 
categories: 
  - Programming
comments: true
layout: post
published: true
status: publish
tags: []
title: VirtualBox卸载增强工具包
type: post
---
﻿﻿﻿有够麻烦的，网上搜了个脚本，貌似有用
<div id="_mcePaste">sudo find /etc -name "*vboxadd*" -exec rm {} ;</div>
<div id="_mcePaste">sudo find /etc -name "*vboxvfs*" -exec rm {} ;</div>
<div id="_mcePaste">sudo rm -r /usr/src/vboxadd-*</div>
<div id="_mcePaste">sudo rm -r /usr/src/vboxvfs-*</div>
<div id="_mcePaste">sudo rm /usr/sbin/vboxadd-timesync</div>
<div id="_mcePaste">sudo rm /lib/modules/`uname -r`/misc/vboxadd.ko</div>
<div id="_mcePaste">sudo rm /lib/modules/`uname -r`/misc/vboxvfs.ko</div>
sudo find /etc -name "*vboxadd*" -exec rm {} ;sudo find /etc -name "*vboxvfs*" -exec rm {} ;sudo rm -r /usr/src/vboxadd-*sudo rm -r /usr/src/vboxvfs-*sudo rm /usr/sbin/vboxadd-timesyncsudo rm /lib/modules/`uname -r`/misc/vboxadd.kosudo rm /lib/modules/`uname -r`/misc/vboxvfs.ko

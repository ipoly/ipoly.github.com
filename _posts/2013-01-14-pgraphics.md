---
layout: post
title: "PGraphics兼容性问题"
description: ""
category: 
tags: [p5, 经验]
---
{% include JB/setup %}

囧东的3D验证码有些许坑爹。于是用p5来做做玩儿。

使用PGraphics对象来缓存和生成图片，原生正常，移植到web端的时候遇到如下问题：

1. 初始化的问题，原生的程序中，PGraphics若要初始化为P3D，那么sketch本身也必须初始化为P3D，否则报错。但在网络端，则相反。
2. web端PGraphics使用`light()`的话，则会报`can only create 8 lights`错误。
3. web端使用PGraphics`vertex()`绘制会报性能问题，看来在web端PGraphics只能用于一些简单的任务。或者代码要写得更好……


<embed src="http://player.youku.com/player.php/sid/XNTAxODIxNTg0/v.swf" allowFullScreen="true" quality="high" width="480" height="400" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash"></embed>

[[项目地址]](https://github.com/ipoly/validationCode)

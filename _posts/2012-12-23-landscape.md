---
layout: p5
title: "landscape"
description: "processing练习"
category: 
tags: []
p5files: [landscape.pde, view.pde]
youku: http://v.youku.com/v_show/id_XNDkyMTE5MzIw.html
github: landscape
---
{% include JB/setup %}

使用noise函数来生成landscape的练习。

通过noiseDetail可以设置变化的强度，官方参考上写的falloff参数合法值应该在0~1之间。不过似乎设置更大也没问题，并且小于1的时候怎么都无法获得一个比较剧烈的曲线，现在设置的参数是`noiseDetail(3,2.5)`。

此外，在web运行时，noise的变化强度比原生的更大。

另一个问题，设置光源后，在web端整个图形都是黑的，原因待查。



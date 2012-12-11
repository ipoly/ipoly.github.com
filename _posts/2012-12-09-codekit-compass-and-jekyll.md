---
layout: post
title: "Codekit Compass & Jekyll"
description: ""
category: 
tags: [经验]
---
{% include JB/setup %}

codekit提供compass工具，当应用在jekyll上时，由于jekyll会将样式表文件等拷贝到_site目录下，然后codekit会试图编译该目录下的sass文件，触发“you must compile individual stylesheets from the project directory”错误。

So，配置codekit也好，配置compass也好，配置jekyll也好，过滤掉_site目录下的sass文件就好。

折腾了一个下午……

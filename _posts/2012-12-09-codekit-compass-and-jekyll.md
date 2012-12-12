---
layout: post
title: "Codekit Compass & Jekyll"
description: ""
category: 
tags: [经验]
---
{% include JB/setup %}

注册域名一年多后，终于把blog搭起来了。

正好在研究compass和bootstrap，所以jekyll-bootstrap就成了不二之选。

既然codekit提供了compass工具，就想索性一站式解决好了。

结果各种“you must compile individual stylesheets from the project directory”报错。

最后发现原因是jekyll生成了_site文件夹后，codekit检测到文件变动，会试图编译其中的sass文件。

So，配置codekit也好，配置compass也好，配置jekyll也好，过滤掉_site目录下的sass文件就好。

折腾了一个下午……

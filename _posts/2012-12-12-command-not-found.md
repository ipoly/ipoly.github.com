---
layout: post
title: "command not found"
description: ""
category: 
tags: [经验]
---
{% include JB/setup %}

本打算更新个about页，但jekyll居然莫名地`command not found`了。

昨儿收工都还好好的啊！？

连带compass也挂了。

试着`sudo gem install jekyll` ,结果：

    ERROR:  Error installing jekyll:
    liquid requires RubyGems version >= 1.3.7. Try 'gem update --system' to update RubyGems itself.

于是依照提示更新gem： `gem update --system`。 再次重装终于成功。但运行时又出现新的bug：
             
    Maruku tells you:
    REXML cannot parse this block of HTML/XML:
    ...
    Illegal character '&' in raw string "Codekit Compass & Jekyll"    

挠头，试着安装了RDiscount：

    sudo gem install rdiscount

设置_config.yml替换掉maruku：

    markdown: rdiscount

解决。但到底是是神马原因引起这一切还真是不得而知。



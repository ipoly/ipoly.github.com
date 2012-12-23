---
layout: post
title: "jekyll with submodules"
description: ""
category: 
tags: [经验]
---
{% include JB/setup %}

更新blog后，收到github的通知：

    The page build failed with the following error:
    page build failed

各种奇怪，因为本地jekyll生成页面一切正常。

各种谷歌，各种修改_config.yml，还把jekyll和liquid降级到跟github的一样，仍然无解。

实在没辙了，下了个jekyll-bootstrap压缩包，一个个地把文件覆盖进去。

最终锁定元凶是作为子模块引入的两个processing练习项目。

然后在stackoverflow上找到这么篇文章：

[How to add submodule into gh-pages branch & build static pages correctly?](http://stackoverflow.com/questions/11817338/how-to-add-submodule-into-gh-pages-branch-build-static-pages-correctly)

里面给出了gitbub的官方FAQ：

[Using submodules with Pages](https://help.github.com/articles/using-submodules-with-pages)

真相大白。虽然最初看gibhub pages文档的时候有看过这一节，但遇到问题的时候完全没有想起来~~~又白白浪费一晚。八嘎。


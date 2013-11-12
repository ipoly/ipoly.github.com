---
layout: post
title: "npm error note"
description: ""
category: 
tags: []
---
{% include JB/setup %}

加班和上课忙乎了半年，完全把blog的事儿给忘了。JB系统该如何维护完全忘光光，看来得抽空重整理一下了。

最近鼓捣[YO][YO]，发现npm已经被玩儿坏了，折腾两天好不终于修复，做下笔记。

1. brew和node似乎有点儿兼容问题，更新npm可能会报错：

		Error: Refusing to delete: /usr/local/bin/npm
	
	官方推荐还是用打包好的安装包安装node为上策。
	
	不过 [Issue #3794][#3794] 有仁兄提出了个解决办法：

		sudo npm update -gf
	
	其余的，就静待brew解决吧。

2. 在使用[YO][YO]的时候各种`npm ERR! Error: EACCES`什么的，通过修改权限解决：

		sudo chown -R `whoami` ~/.npm
		sudo chown -R `whoami` /usr/local/lib/node_modules
	
	原文在此：[NPM throws error without sudo][stackoverflow_16151018]
		

[YO]: http://yeoman.io
[#3794]: https://github.com/isaacs/npm/issues/3794
[stackoverflow_16151018]: http://stackoverflow.com/questions/16151018/npm-throws-error-without-sudo
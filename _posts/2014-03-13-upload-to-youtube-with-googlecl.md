---
layout: post
title: "使用GoogleCL传视频到Youtube"
description: ""
category:
tags: []
---
{% include JB/setup %}

最近需要给妹子传300M+的视频到Youtube，小水管传国内网站就已经吐血了，更何况翻墙~

于是便寻思着利用Dropbox上传的方法。然后便发现[GoogleCL][#1]此等神器。

总之，步骤如下：

1. 先把视频丢到Dropbox里，等它慢慢地上传好，获得公开的地址。
2. 到[Koding][#2]里(或者其他海外vps)下载。
		
		curl -O <Your Dropbox public link address>
		
	服务器对服务器下载速度5M/S左右，刷刷地~ ^_^
3. [Install GoogleCL][#3]

		sudo apt-get install python-pip
		sudo pip install googlecl
		mkdir -p ~/.local/share/googlecl
4. 开始上传

		google youtube post <File name> --category <YouTube category>
		
	分类名是必须的，参考：[YouTube category list][#4]。
	
5. 重点来了，第一次上传，会要求google授权，首先要输入`user`，用相应的google账户就好。

	接着程序会打开命令行版本的浏览器进行授权，一路`A`过去，然后会让你输入账号密码登录，因为此浏览器是没有脚本的，所以即使登录了，也无法进行授权，这个时候，按`q`退出浏览器，返回shell，会看到这样一段提示：
	
		Please log in and/or grant access via your browser at https://www.google.com/accounts/OAuthAuthorizeToken?oauth_token=xxxxxxxxxxxxxxxxxxxxxxxx then hit enter.
		
	于是，把其中的url拷贝出来，在本机用浏览器打开，完成授权，回到shell，回车，便Ok啦。
	
	服务器对服务器，刷刷地~ ^_^

[#1]:https://code.google.com/p/googlecl/
[#2]:https://koding.com
[#3]:https://code.google.com/p/googlecl/wiki/Install
[#4]:https://code.google.com/p/googlecl/wiki/Manual#YouTube


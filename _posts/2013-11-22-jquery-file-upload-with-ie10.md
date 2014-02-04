---
layout: post
title: "jQuery File Upload with IE10"
description: ""
category: 
tags: []
---
{% include JB/setup %}

因为需要动态显示上传进度，项目中使用了 [jQuery File Upload][jfu] 作为上传组件。

同时需要跨域以并且传递cookies。算是该用的特性都用上了。

然后，今儿，PC_1的 `IE10`上，华丽丽滴失效了。折腾了大半天才解决，总结如下：

###表现：

	PC_1: 在POST请求中一直挂起无响应。
	PC_2: 工作正常，虽然命令行会一直提示跨域。
	PC_3: 没有OPTIONS请求，并且POST响应无数据。

其中 *PC_3* 是 [modern.ie][modern] 提供的虚拟机。

###解决方案：
来自于高大上的 [stackoverflow][#1]。 

重置IE设置后，PC_2 果断恢复正常。PC_3 回光返照一会儿后又不行了。

最后调试发现，对于 PC_3 需要：

1. 重设IE设置。
2. 然后在`安全设置中`，将各个 `启用保护模式` 全部取消。
3. **【并且】**，登录站点时 [不能] 让IE `记住密码`。

# 我嘞个去！尼玛IE还真是一如既往地奇葩啊！！！！！



[jfu]: http://blueimp.github.io/jQuery-File-Upload/
[#1]: http://stackoverflow.com/questions/16976079/jquery-file-upload-stuck-in-pending-state-with-ie10-zero-byte-file
[modern]: http://www.modern.ie/zh-cn
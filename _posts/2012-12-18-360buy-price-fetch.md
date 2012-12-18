---
layout: post
title: "京东价格抓取"
description: ""
category: 
tags: [经验]
---
{% include JB/setup %}

最近的一个活儿是为某代购网站做浏览器插件，把当前页面的商品信息抓取下来生成订单提交到其网站上去。

本来囧东之前就和一淘在打架，不给抓价格了，所以丫的价格是个图片。

不过丫却把产品的相关信息给写到页面内的全局变量下了，通过pageConfig.product就可以取到，虽然和页面显示的有差别，不过由于价格不是所需求的必要字段，咱也就凑合了。

但是。

活儿还没交付呢，囧东连这点儿便利也不给了。

于是……

*头儿：* 想想办法呗，价格字段空着好别扭啊。

*我：* 人页面上都不给抓了，没辙啊~总不能做图像识别吧？

*头儿：* 我看有文章说可以把商品加入购物然后读数据的~

*我：* 人都不让你抓，强抓不太好吧。再说了，操作用户购物车诶~感觉不太地道啊~~~

*头儿：* 抓！

*我：* 好！

直接丢个货到购物车，看起来请求是从gate子域名跳转到cart下的initCart.action，再一个302重定向到addToCart.html。

试着直接在地址栏输入地址，最后确定直接通过initCart.action即可成功加入购物车：
 `http://cart.360buy.com/cart/initCart.action?pid=xxxxxxxx&pcount=1&ptype=1`

嗯嗯，那么如果ajax没问题的话，就返回的页面读取商品价格就行了:

    $.get("http://cart.360buy.com/cart/initCart.action?pid=623987&pcount-1&ptype=1",function(data){console.log("done:",$("data"))}).fail(function(a){console.log("error:",a)})

结果initCart.action成功返回302，但addToCart.html显示`canceled`。

这是神马情况？直接访问呢？

    $.get("http://cart.360buy.com/cart/addToCart.html?rcd=1&pid=623987&rid=1355715916949",function(data){console.log("done:",$("data"))}).fail(function(a){console.log("error:",a)})

好吧，原来是重定向后因为跨域被浏览器阻止了。得想别的招。比如image beacon：

    var a = $("<img/>");
    a.on("load",function(){console.log("done")});
    a.attr("src","http://cart.360buy.com/cart/initCart.action?pid=623987&pcount-1&ptype=1");

理所当然地成功了，唯一的问题是……onload事件未触发……难道是因为载入的其实并不是真正的图片么？

翻书、翻谷歌……似乎image beacon还真就适用于无需服务器响应的请求……

挠墙……咋整，总不能傻不啦叽地用个setTimeout吧。或者用iframe然后侦听它的window.onload?光想想就很挫啊……

不管怎么说，img的资源载入是完成了的，也许可以借用别的属性神马的？

于是尝试image.complete属性……失败……不管是否载入资源，直接就是true。

image.onAbort事件应该没用。那么onError呢？

    var a = $("<img/>");
    a.on("error",function(){console.log("done")});
    a.attr("src","http://cart.360buy.com/cart/initCart.action?pid=623987&pcount-1&ptype=1");

擦！还真成了！敢情onError包括文件格式的错误，而不仅仅是资源是否加载成功啊。

于是，顺理成章地适用onError事件来调用后续处理，囧东购物车自己用的是jsonp，轻而易举得到数据然后删除刚加入的商品……神不知鬼不觉……

剩下的就是把原来的抓取代码改成兼容个别属性异步处理的，感谢jQuery1.5后增加了deferred对象，只简单地修改了price抓取函数并做了个分支处理就完成了，不然在简单的for循环中插入一个异步抓取的属性……想想都一团乱麻啊……

总结，用onerror事件来判断服务端响应完成，这种感觉还真诡异……不过若服务端真的响应失败了，也就无从得知了，到底是在别人的地盘儿上偷数据，认了吧。









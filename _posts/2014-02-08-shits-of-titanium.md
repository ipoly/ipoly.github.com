---
layout: post
title: "Titanium那些坑"
description: ""
category: 
tags: []
---
{% include JB/setup %}

涉足这货的前因后果按下不表，直接秀结论。

除了语法使用js以外，其实跟前端没什么关系。Alloy框架使用xml构建结构，tss控制样式 --- 不同平台下可能需要不同的样式设置。

scrollAbleView中每次滚动都会触发其中imageView的load事件 —— 第一页和最后一页除外，几经测试都没搞清楚它们俩的load事件到底何时触发。

imageView的动态width和height可以从size中取得，如果没有事先定义，直接访问这个两个属性会是undefined。更靠谱的是rect属性，可以获取到x和y，size中这俩永远为0。用toImage()转化后也可以取得，但是开销很大，IOS上没感觉，ANDROID上很明显。

事件对象event的x和y属性是基于event.source对象坐标系的，于是乎如果事件是在子元素上触发，得使用event.source.convertPointToView方法转换到父元素坐标系上来 —— 略显蛋疼。

监听touchmove事件，通过设置left和top来拖动元素，如果事件在被拖动的元素上触发，则无法正确设置其坐标([四年前的bug居然到现在还是老样子][#2])。
解决办法：

1. [把事件绑定在不相干的独立元素上监听][#3] —— 这样感觉挺违和的。

2. 使用模块 [Ti.Draggable][#1]，但测试发现它不支持imageView，子元素也不能触发事件 —— 放弃。

3. 使用animate()方法。既可以修改left和top属性，也可以用2DMatrix.translate。
	
	但是2DMatrix无论使用transfrom属性还是setTransform()方法都无效。必须使用animate()方法。
	
	此处有个坑是修改left和top属性来调整位置的话，必须把位移量除以2~3。使用translate则不必，未找到原因。
	
	另外目前文档中提到Mobile Web和Tizen中animate后无法更新rect属性。但目前在ANDROID上也遇到这个bug了。
	
总的说来，Ti的文档[不怎么给力][#4]，Q&A上的资料经常都是两三年前的，stackoverflow上的资源也特别少，中文资料更大把都是教你如何部署开发环境……。整个学习过程如陷泥潭。

Ti之初体验到此为止 —— 因为一怒之下PO主已经开始学iOS7的开发了。学习iOS7最大的心理障碍无非是objc的语法有点儿非主流，但xcode用起来真是各种丝般柔顺么么哒，好喜欢~

[#1]: https://github.com/pec1985/TiDraggable
[#2]: http://developer.appcelerator.com/question/33871/dragging-and-dropping-elements
[#3]: https://gist.github.com/dominikkukacka/1593864
[#4]: http://rensanning.iteye.com/blog/1458752

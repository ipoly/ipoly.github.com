---
layout: post
title: "Webshim with Angularjs"
description: ""
category: 
tags: []
---
{% include JB/setup %}

[Webshim][ws]和[Angularjs][ng]合用的时候，遇到[Angularjs][ng]动态生成节点时会有bug，比如[ngSwitch][ngSwitch]内的 *input* 使用 *placeholder* ，会导致 *scope* 出现问题从而[ngModel][ngModel]无法按预期行动。

解决办法是在新节点生成后调用[Webshim][ws]的 `updatePolyfill` 方法：
		
		# coffeescript
		angular.module('components')
		# 修复WSpalceholder与ngModel的冲突
		.directive('placeholder',->
       	 		{
            		restrict: 'A'
            		link:  ($scope,$elm,$attrs,ngModel)->
                		$elm.updatePolyfill()
        		}
		)

参考：[Dynamically adding HTML5 markup][wsDoc]

[ws]: http://afarkas.github.io/webshim/demos/
[ng]: http://code.angularjs.org/
[ngSwitch]: http://code.angularjs.org/1.0.8/docs/api/ng.directive:ngSwitch
[ngModel]: http://code.angularjs.org/1.0.8/docs/api/ng.directive:ngModel
[wsDoc]: http://afarkas.github.io/webshim/demos/demos/shiv.html#dynamic
// Generated by CoffeeScript 1.4.0
(function(){$(function(){var e;$("body").on("mouseenter mouseleave","a",function(t){clearTimeout($(this).data("timer"),$(this).css({top:0,left:0,transform:"rotate(0deg)"}));if(t.type==="mouseenter")return e.apply(this)});e=function(){var t,n,r,i,s,o,u,a;r=Math.random;t=[-1,0,1];n=[-2,-1,0,1,2];i=$(this);s=t[parseInt(r()*3)];u=n[parseInt(r()*5)];a=n[parseInt(r()*5)];i.css({position:i.css("position")==="static"?"relative":void 0,display:i.css("display")==="inline"?"inline-block":void 0,top:u,left:a,transform:"rotate("+s+"deg)"});o=setTimeout($.proxy(e,this),33);return i.data("timer",o)};return null})}).call(this);
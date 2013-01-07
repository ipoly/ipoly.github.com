---
layout: post
title: "Docco 文档生成器"
description: ""
category: 
tags: [工具,CoffeeScript,Javascript]
---
{% include JB/setup %}

按它自己的说法，这是一个马马虎虎的，冗长的，文学化编程风格的文档生成器。

使用[Markdown][md]来解析注释，用[Pygments][pm]来进行代码高亮。

支持CoffeeScript, JavaScript, Ruby, Python, 和 TeX 文档。

只支持单行注释。

基于Node.js，不过有若干其他语言的实现：[Ruby][Rocco], [Python][Pycco], [POSIX shell][Shocco], [Clojure][Marginalia], [Lua][Locco]（这个版本是单语支持的） 和 [.Net][Nocco]。嗯，适口性不错。

生成结果就是其[官网][docco]的模样，看起来还行。

使用方式自然是命令行：

    docco src/*.coffee

所以它会根据后缀自行处理，相比之下[YUIDoc][yuidoc]必须使用`--syntaxtype`来设置CoffeeScript，还没缩写……略显坑爹啊……

可以带参数：

    -h, --help             output usage information
    -V, --version          output the version number
    -c, --css [file]       use a custom css file
    -o, --output [path]    use a custom output path
    -t, --template [file]  use a custom .jst template

不过其他的实现带的参数未必一样，比如Pyhon版目前只有这些：

    -h, --help                        show this help message and exit
    -p, --paths                       Preserve path structure of original files
    -d OUTDIR, --directory=OUTDIR     The output directory that the rendered files should go to.
    -w, --watch                       Watch original files and re-generate documentation on changes

最后，作者用推荐[CoffeeDoc][coffeedoc]写API文档。[效果][CoffeeDocView]也蛮漂亮。另外，这货还能生成Github的[wiki页][wiki]，感觉更加有趣了。



[wiki]: https://github.com/apgwoz/coffeedoc-hub/wiki/Src:Coffeedoc
[CoffeeDocView]: http://omarkhan.me/coffeedoc/test/example.coffee.html
[coffeedoc]: https://github.com/omarkhan/coffeedoc
[Nocco]: http://dontangg.github.com/nocco/
[Locco]: http://rgieseke.github.com/locco/
[Marginalia]: http://fogus.me/fun/marginalia/
[Pycco]: http://fitzgen.github.com/pycco/
[Shocco]: http://rtomayko.github.com/shocco/
[Rocco]: http://rtomayko.github.com/rocco/rocco.html
[yuidoc]: http://yui.github.com/yuidoc/args/index.html
[pm]: http://pygments.org/
[md]: http://wowubuntu.com/markdown/
[docco]: http://jashkenas.github.com/docco/

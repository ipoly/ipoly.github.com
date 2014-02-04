$ ->
    container = $("[data-douban]")
    id = container.data("douban")
    return unless id

    para = {alt:"xd",apikey:"0a450ab03fde0d441ecf2010bf9a27cc"}

    tpl = """<div class="alert alert-info">
        <div class="row show-grid doubanIntro">
          <div class="span">
            <a href="${link[1]['@href']}"><img src="${link[2]['@href']}" alt="image"></a>
          </div>
          <div class="span6 bookinfo">
            <span class="label label-important">
                ${_['db:attribute'].title} - ${_['db:attribute'].subtitle}
            </span>
            <p>${_['db:attribute']['author-intro']}</p>
          </div>
        </div>
        </div>"""

    callback = (data) ->
        dataObj = {}
        dataObj[i['@name']] = i.$t for i in data["db:attribute"]
        data["db:attribute"] = dataObj
        doubanIntro = $(juicer(tpl,data))
        doubanIntro.hide()
        container.prepend(doubanIntro)
        $(window).load(->
            doubanIntro.show("normal")
        )

    $.getJSON("http://api.douban.com/book/subject/#{id}?callback=?", para, callback)
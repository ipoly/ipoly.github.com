$ ->
    container = $("[data-douban]")
    id = container.data("douban")
    return unless id

    para = {alt:"xd",apikey:"0a450ab03fde0d441ecf2010bf9a27cc"}

    tpl = """
    <div class="row show-grid doubanIntro">
      <div class="span">
        <a href="${link[1]['@href']}"><img src="${link[2]['@href']}" alt="image"></a>
      </div>
      <div class="span6">
        <p> <strong>子标题：</strong> ${_['db:attribute'][0].$t}</p>
        <p> <strong>作者介绍：</strong> ${_['db:attribute'][3].$t}</p>
      </div>
    </div>
    """

    callback = (data) ->
        doubanIntro = $(juicer(tpl,data))
        doubanIntro.hide()
        container.prepend(doubanIntro)
        $(window).load(->
            doubanIntro.show("normal")
        )

    $.getJSON("http://api.douban.com/book/subject/#{id}?callback=?", para, callback)
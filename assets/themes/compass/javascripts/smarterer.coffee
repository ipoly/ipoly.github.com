$ ->
    $.getJSON("/smarterer.json",(data)->
        container = $("#smarterer")
        imgs = ""
        imgs += "<img src='#{i.badge.image}' name='i.quiz.name'>" for i in data.badges
        container.html(imgs)
    )
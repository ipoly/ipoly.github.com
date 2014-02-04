$ ->
    $("body").on("mouseenter mouseleave","a",(e)->
        clearTimeout($(@).data("timer")
        $(@).css({
            top: 0,
            left: 0,
            transform: "rotate(0deg)"
        }))

        if e.type is "mouseenter"
            shake.apply(@)
    )

    shake = () ->
        random = Math.random
        RANGE1 = [-1, 0, 1]
        RANGE2 = [-2,-1, 0, 1, 2]
        that = $(@)

        theta = RANGE1[parseInt(random()*3)]
        xoff = RANGE2[parseInt(random()*5)]
        yoff = RANGE2[parseInt(random()*5)]

        that.css({
            position: if that.css("position") is "static" then "relative",
            display: if that.css("display") is "inline" then "inline-block",
            top: xoff,
            left: yoff,
            transform: "rotate(#{theta}deg)"
        })

        timer = setTimeout($.proxy(shake, this), 33)
        that.data("timer",timer)

    null
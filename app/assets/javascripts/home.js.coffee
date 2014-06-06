 $ ->
   $(".skiplink a").on "click", (e) ->
    e.preventDefault()
    target = @hash
    $target = $(target)
    $("html, body").stop().animate
      scrollTop: $target.offset().top
    , 500, ->
      window.location.hash = ""


  targets = $("[rel~=tooltip]")
  target = false
  tooltip = false
  title = false
  targets.bind "mouseenter", ->
    target = $(this)
    tip = target.attr("title")
    tooltip = $("<div class=\"my-tooltip\"></div>")
    return false  if not tip or tip is ""
    target.removeAttr "title"
    tooltip.css("opacity", 0).html(tip).appendTo "body"
    init_tooltip = ->
      if $(window).width() < tooltip.outerWidth() * 1.5
        tooltip.css "max-width", $(window).width() / 2
      else
        tooltip.css "max-width", 340
      pos_left = target.offset().left + (target.outerWidth() / 2) - (tooltip.outerWidth() / 2)
      pos_top = target.offset().top - tooltip.outerHeight() - 20
      if pos_left < 0
        pos_left = target.offset().left + target.outerWidth() / 2 - 20
        tooltip.addClass "left"
      else
        tooltip.removeClass "left"
      if pos_left + tooltip.outerWidth() > $(window).width()
        pos_left = target.offset().left - tooltip.outerWidth() + target.outerWidth() / 2 + 20
        tooltip.addClass "right"
      else
        tooltip.removeClass "right"
      if pos_top < 0
        pos_top = target.offset().top + target.outerHeight()
        tooltip.addClass "top"
      else
        tooltip.removeClass "top"
      tooltip.css(
        left: pos_left
        top: pos_top
      ).animate
        top: "+=10"
        opacity: 1
      , 50
      return

    init_tooltip()
    $(window).resize init_tooltip
    remove_tooltip = ->
      tooltip.animate
        top: "-=10"
        opacity: 0
      , 50, ->
        $(this).remove()
        return

      target.attr "title", tip
      return

    target.bind "mouseleave", remove_tooltip
    tooltip.bind "click", remove_tooltip
    return

  return

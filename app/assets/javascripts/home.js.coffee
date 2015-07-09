 $ ->
  $(".skiplink a").on "click", (e) ->
    e.preventDefault()
    target = @hash
    $target = $(target)
    $("html, body").stop().animate
      scrollTop: $target.offset().top
    , 500, ->
      window.location.hash = ""

  $(window).bind 'load', ->
    footer = $('.main-footer')
    pos = footer.position()
    height = $(window).height()
    height = height - (pos.top)
    height = height - footer.height()
    if height > 0
      footer.css 'margin-top': height + 'px'



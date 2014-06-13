 $ ->
  $(".skiplink a").on "click", (e) ->
    e.preventDefault()
    target = @hash
    $target = $(target)
    $("html, body").stop().animate
      scrollTop: $target.offset().top
    , 500, ->
      window.location.hash = ""

  $('.hover-dim').hover(->
    $(@).animate
      opacity: 0.8
    , 300
    return
  ).mouseout ->
    $(@).animate
      opacity: 1
    , 100
    return



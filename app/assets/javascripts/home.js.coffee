 $ ->
   $(".skiplink a").on "click", (e) ->
    e.preventDefault()
    target = @hash
    $target = $(target)
    $("html, body").stop().animate
      scrollTop: $target.offset().top
    , 500, ->
      window.location.hash = ""



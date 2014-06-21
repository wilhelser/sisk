$ ->
  $(document).delegate '.benefit', 'click', ->
    $(@).addClass "benefit-flipped"
    $(this).find(".card").addClass("flipped").mouseleave ->
      $(this).removeClass "flipped"
      $('.benefit-flipped').removeClass "benefit-flipped"

  $(document).delegate '.section', 'click', ->
    $(@).addClass "benefit-flipped"
    $(this).find(".card").addClass("flipped").mouseleave ->
      $(this).removeClass "flipped"
      $('.benefit-flipped').removeClass "benefit-flipped"

  $('.disabled').click ->
    false

  $('.search-form').submit ->
    $('.search-button').after("&nbsp;<img class='loader' src='/sisk-loader.gif'>")

  $(document).delegate ".coupon-print-btn", 'click', ->
    $(".printable").print()

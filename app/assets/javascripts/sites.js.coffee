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

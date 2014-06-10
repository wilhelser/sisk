$ ->
  $('.benefit').click ->
    $(@).addClass "benefit-flipped"
    $(this).find(".card").addClass("flipped").mouseleave ->
      $(this).removeClass "flipped"
      $('.benefit-flipped').removeClass "benefit-flipped"

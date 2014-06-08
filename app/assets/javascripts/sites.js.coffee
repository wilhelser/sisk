$ ->
  $('.flip').click ->
    $(this).find(".card").addClass("flipped").mouseleave ->
      $(this).removeClass "flipped"

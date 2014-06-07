$('.flip').click ->
  alert 'clicked'
  $(this).find(".card").addClass("flipped").mouseleave ->
    $(this).removeClass "flipped"

$('.benefit').click ->
  alert 'clieck'

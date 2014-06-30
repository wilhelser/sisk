$ ->
  # $(document).delegate '.benefit', 'click', ->
  #   $(@).addClass "benefit-flipped"
  #   $(this).find(".card").addClass("flipped").mouseleave ->
  #     $(this).removeClass "flipped"
  #     $('.benefit-flipped').removeClass "benefit-flipped"

  # $(document).delegate '.section', 'click', ->
  #   $(@).addClass "benefit-flipped"
  #   $(this).find(".card").addClass("flipped").mouseleave ->
  #     $(this).removeClass "flipped"
  #     $('.benefit-flipped').removeClass "benefit-flipped"

  # $('.benefit').quickFlip()
  # $('.section').quickFlip()

  $('.disabled').click ->
    false

  $('.flip-back').hide()

  $('.section').click ->
    @front = $(@).find('.flip-front')
    @back = $(@).find('.flip-back')
    if $(@).hasClass('flipped')
      $(@front).show()
      $(@back).hide('fast')
      $(@).removeClass('flipped')
    else
      $(@front).hide('fast')
      $(@back).show()
      $(@).addClass('flipped')


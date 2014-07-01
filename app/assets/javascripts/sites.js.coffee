$ ->

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

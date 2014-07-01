$ ->

  $('.disabled').click ->
    false

  $('.flip-back').hide()

  $('.section').click ->
    $('.flip-back').hide().removeClass('flipped')
    $('.flip-front').show()
    @front = $(@).find('.flip-front')
    @back = $(@).find('.flip-back')
    if $(@).hasClass('flipped')
      $(@front).show()
      $(@back).hide('fast')
      $(@).removeClass('flipped')
    else
      $(@front).hide('fast')
      $(@back).show()
      $(@).addClass('flipped').mouseleave ->
        $(@).removeClass('flipped')
        $(@back).hide('fast')
        $(@front).show()

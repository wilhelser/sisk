$ ->
    $('.account-button').click ->
      parent = $(this).parents('.benefit-item')
      if $(parent).hasClass('open')
        $(parent).animate { height: '280px' }, 500
        $(parent).removeClass 'open'
        $(this).text 'Show More'
        $(parent).find('footer').css('background-image', 'url(/benefit-gradient.png)')
      else
        $(parent).animate { height: $(parent).get(0).scrollHeight }, 500
        $(parent).find('footer').css('background-image', 'none')
        $(parent).addClass('open')
        $(this).text('Show Less')
      return

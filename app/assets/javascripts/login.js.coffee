$ ->

  $('#new_login').on 'ajax:error', (event, xhr, status, error) ->
    # insert the failure message inside the "#account_settings" element
    $('#errors').html(xhr.responseText)

  $('#new_login').on 'ajax:success', (xhr, data, status) ->
    console.log data.site_id
    window.location.href = "/sites/#{data.site_id}"

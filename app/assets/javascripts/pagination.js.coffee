$ ->
  $('#show_more_link').on 'click', (e) ->
   e.preventDefault()
   url = $(this).attr('href')
   $.getScript(url)
   
jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page a').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').html('<img src="/assets/loader.gif" alt="Fetching more posts..." title="Fetching more posts..." />')
        $.getScript(url)
    $(window).scroll()
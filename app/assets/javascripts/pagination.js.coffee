jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page a').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').html('<img src="https://res.cloudinary.com/instapost/image/upload/v1491744231/loader_kziqlv.gif" alt="Fetching more posts..." title="Fetching more posts..." />')
        $.getScript(url)
    $(window).scroll()
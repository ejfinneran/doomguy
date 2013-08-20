$ () ->
  $("#slider").slider(
    slide: (event, ui) ->
      $("#face").attr("src", "/value/#{ui.value}")
    )

$ () ->
  $("#slider").slider(
    slide: (event, ui) ->
      $("#face").attr("src", "/damage/#{ui.value}.gif")
      $("#example").text("<img src=\"http://doomguy.io/damage/#{ui.value}.gif\">")
    )

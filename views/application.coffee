$ () ->
  $("#slider").slider(
    slide: (event, ui) ->
      $("#face").attr("src", "/damage/#{ui.value}.gif")
      $("#example").text("<img src=\"http://doomguy.herokuapp.com/damage/#{ui.value}.gif\">")
    )

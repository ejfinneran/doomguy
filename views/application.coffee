updateImage = (value) ->
  $("#face").attr("src", "/damage/#{value}.gif")
  $("#example").text("<img src=\"http://doomguy.herokuapp.com/damage/#{value}.gif\">")
  $("#inverse-example").text("<img src=\"http://doomguy.herokuapp.com/inverse/#{100-value}.gif\">")

$ () ->
  $("#slider").slider(
    slide: (event, ui) ->
      updateImage(ui.value)
    )

$ () ->
  for item in $("#damage-buttons > button")
    do (item) ->
      damage = $(item).data("damage")
      $(item).click () ->
        $("#slider").slider("value", damage)
        updateImage(damage)

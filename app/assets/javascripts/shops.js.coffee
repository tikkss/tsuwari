$ ->
  $("#add_serving").click ->
    $("#food_error").hide()
    check_food = false
    fields     = null
    search_food = $("#search_food").val()
    $(".food_name").each (idx, obj) ->
      if search_food == $(obj).text()
        fields = obj
        check_food = true

    if !check_food
      $.get(
        "/shops/add_food",
        name: search_food
      )
      $("#search_food").val('')
      return

    if $(fields).closest('.fields').is(':visible')
      $("#food_error").show()
      $("#food_name").text(search_food)
      $("#error_message").text("は既に追加されています")
    else
      $(fields).next("td").find("input[type='hidden']" + '.destroy').val(false)
      $(fields).closest('.fields').show()
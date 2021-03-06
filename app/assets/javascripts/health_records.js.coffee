$ ->
  $("#search_food").autocomplete
    source: (req, res) ->
      $.ajax
        url: "/foods/search.json"
        type: "get"
        cache: false
        dataType: "json"
        data:
          food:
            name: req.term
        success: (o) ->
          res o

  $("#search_food").keypress (e) ->
    e = window.event  unless e
    if e.keyCode is 13
      e.preventDefault()
      $("#add_food").click()
      false

  $("#add_food").click ->
    $("#food_error").hide()
    check_food = false
    fields     = null
    search_food = $("#search_food").val()
    $(".eating_name").each (idx, obj) ->
      if search_food == $(obj).text()
        fields = obj
        check_food = true

    if !check_food
      $.get(
        "/health_records/new_eating",
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

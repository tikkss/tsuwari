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
    check_food = false
    search_food = $("#search_food").val()
    $(".eating_name").each (idx, obj) ->
      if search_food == $(obj).text()
        check_food = true

    if check_food
      $("#food_error").show()
      $("#food_name").text(search_food)
      $("#error_message").text("は既に追加されています")
      return

    $.get(
      "/health_records/new_eating",
      name: search_food
    )


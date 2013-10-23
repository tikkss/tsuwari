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
    console.log $("#search_food").val()
    $("#search_food").val("")


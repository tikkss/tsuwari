$("#eatings").append(
  "<%=j render(partial: "eating_fields", locals: { eating: @eating }) %>"
)

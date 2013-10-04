json.array!(@foods) do |food|
  json.extract! food, :name
  json.url food_url(food, format: :json)
end

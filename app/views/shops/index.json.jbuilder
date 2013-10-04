json.array!(@shops) do |shop|
  json.extract! shop, :name, :prefecture, :city, :address, :url, :category_id
  json.url shop_url(shop, format: :json)
end

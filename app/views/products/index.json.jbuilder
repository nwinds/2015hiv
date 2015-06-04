json.array!(@products) do |product|
  json.extract! product, :id, :name, :detail, :icon_url, :price
  json.url product_url(product, format: :json)
end

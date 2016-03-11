json.items do |json|
  json.array!(@items) do |item|
    json.extract! item, :id, :item_type, :description, :quantity, :unit_price
    json.url item_url(item, format: :json)
  end
end

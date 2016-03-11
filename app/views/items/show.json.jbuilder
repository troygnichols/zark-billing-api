json.item do |json|
  json.extract! @item, :id, :item_type, :description, :quantity, :unit_price, :created_at, :updated_at
end

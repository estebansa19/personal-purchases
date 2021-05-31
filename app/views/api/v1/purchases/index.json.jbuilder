json.array! @purchases do |month, purchases|
  json.month month
  json.total purchases.sum(&:value)
  json.purchases purchases.as_json(only: [:value, :title, :created_at])
end

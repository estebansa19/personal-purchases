json.array! @monthly_purchases do |monthly_purchase|
  json.month monthly_purchase.month.to_date.strftime('%B, %Y')
  json.total monthly_purchase.purchases.sum { |record| record['value'].to_i }
  json.purchases monthly_purchase.purchases
end

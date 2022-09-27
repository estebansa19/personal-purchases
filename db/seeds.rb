current_time = Time.current
purchases_attributes = [
  {
    title: 'food', value: 66666, created_at: current_time, updated_at: current_time
  },
  {
    title: 'cellphone', value: 1000000, created_at: current_time, updated_at: current_time
  },
  {
    title: 'clothes', value: 100000, created_at: current_time, updated_at: current_time
  },
  {
    title: 'coffee', value: 10000, created_at: current_time, updated_at: current_time
  },
  {
    title: 'transport', value: 100000, created_at: current_time, updated_at: current_time
  }
]

monthly_purchase = MonthlyPurchase.find_or_create_by(month: Date.current.beginning_of_month)
monthly_purchase.purchases << purchases_attributes
monthly_purchase.save

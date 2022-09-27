current_time = Time.current

records_attributes = [
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

Purchase.insert_all(records_attributes)

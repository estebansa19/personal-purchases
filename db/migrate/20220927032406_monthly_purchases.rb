class MonthlyPurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :monthly_purchases do |t|
      t.date :month, index: true
      t.jsonb :purchases, default: []

      t.timestamps
    end

    purchases_by_month = Purchase.
      select(:title, :value, :created_at).
      group_by { |purchase| "#{purchase.created_at.strftime('%Y-%m')}-01" }

    purchases_by_month.each do |month, purchase_records|
      current_month_record = MonthlyPurchase.find_or_create_by(month: month)
      current_month_record.purchases = []

      purchase_records.each do |purchase_record|
        current_month_record.purchases << {
          title: purchase_record.title, value: purchase_record.value, date: purchase_record.created_at
        }
      end

      current_month_record.save
    end
  end
end

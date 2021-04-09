class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.string :title
      t.integer :value, null: true, default: 0

      t.timestamps
    end
  end
end

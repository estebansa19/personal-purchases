class RemovePurchasesTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :purchases
  end
end

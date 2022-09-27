class MonthlyPurchase < ApplicationRecord
  validates :month, :purchases, presence: true
end

class WbInfo < ApplicationRecord
  def self.as_money
    number_to_currency(self, unit: "$")
  end
end

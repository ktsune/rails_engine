class Transaction < ApplicationRecord
  belongs_to :invoice

  def self.order_with_id
    self.order("id asc")
  end
end

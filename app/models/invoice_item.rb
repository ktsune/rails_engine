class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  validates_presence_of :quantity,
                        :unit_price

  def self.order_with_id
    self.order("id asc")
  end
end

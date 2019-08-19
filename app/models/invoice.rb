class Invoice < ApplicationRecord

  has_many :invoice_items
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :items, through: :invoice_items

  def self.order_with_id
    self.order("id asc")
  end

  def invoices_items
    self.joins(:items)
    .select('items.*')
  end
end

class Merchant < ApplicationRecord

  has_many :items
  has_many :customers
  has_many :invoices, through: :invoice_items

  validates_presence_of :name
end

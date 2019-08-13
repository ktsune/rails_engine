class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :customers
  has_many :invoices, through: :invoice_items 
end

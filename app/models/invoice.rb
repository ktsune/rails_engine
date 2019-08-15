class Invoice < ApplicationRecord

  has_many :invoice_items 
  has_many :items, through: :invoice_items
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions

  validates_presence_of :status
end

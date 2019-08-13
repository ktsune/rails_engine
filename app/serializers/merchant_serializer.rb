class MerchantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name

  has_many :items
  has_many :customers
  has_many :invoices, through: :invoice_items 
end

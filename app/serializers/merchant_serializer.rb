class MerchantSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :name

  has_many :items
  has_many :invoices
  # has_many :invoice_items, through: :items
end

class MerchantSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :name, :created_at, :updated_at

  has_many :items
  has_many :invoices
  # has_many :invoice_items, through: :items
end

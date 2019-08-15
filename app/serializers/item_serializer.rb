class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :merchant_id, :description, :unit_price

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  attribute :unit_price do |object|
    "%.2f" % (object.unit_price.to_f / 100)
  end
end

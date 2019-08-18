class InvoiceItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :item_id, :invoice_id, :quantity, :unit_price

  belongs_to :item
  belongs_to :invoice

  attribute :unit_price do |object|
    "%.2f" % (object.unit_price.to_f / 100)
  end
end

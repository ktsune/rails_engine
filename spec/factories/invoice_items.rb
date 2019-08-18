FactoryBot.define do
  factory :invoice_item do
    quantity { rand(1..10) }
    unit_price { rand(1..10) }

    invoice
    item 
  end
end

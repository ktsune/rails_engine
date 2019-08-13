FactoryBot.define do
  factory :item do
    name { "MyString" }
    description { "MyString" }
    unit_price { 1.5 }
    merchant { nil }
    created_at { "2019-08-13 11:50:18" }
    updated_at { "2019-08-13 11:50:18" }
  end
end

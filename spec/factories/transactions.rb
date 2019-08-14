FactoryBot.define do
  factory :transaction do
    credit_card_number { Faker::String.random(length: 16) }
    credit_card_expiration_date { Faker::Date.forward(days: 23) }
    result { "success" }
  end
end

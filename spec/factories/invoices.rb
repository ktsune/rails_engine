FactoryBot.define do
  factory :invoice do
    status { "shipped" }

    merchant
    customer 
  end
end

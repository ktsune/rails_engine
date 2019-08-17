require 'rails_helper'

describe 'Customers API' do
  it 'sends a list of Customers' do
    create_list(:customer, 5)

    get '/api/v1/customers'

    expect(response).to be_success

    customers = JSON.parse(response.body)

    expect(customers["data"].count).to eq(5)
  end

  it "can get one customer by its id" do
   id = create(:customer).id

   get "/api/v1/customers/#{id}"

   customer = JSON.parse(response.body)

   expect(response).to be_successful
   expect(customer["data"]["id"].to_i).to eq(id)
  end

  it "merchant where the customer has conducted the most successful transactions" do
   id = create(:customer).id

   get "/api/v1/customers/#{id}/favorite_merchant"

   customer = JSON.parse(response.body)

   expect(response).to be_successful
   # expect(customer["data"]["id"].to_i).to eq(id)
  end
end

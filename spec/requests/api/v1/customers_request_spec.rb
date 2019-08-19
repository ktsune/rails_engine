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
  #
  # it "merchant where the customer has conducted the most successful transactions" do
  #  id = create(:customer).id
  #
  #  get "/api/v1/customers/#{id}/favorite_merchant"
  #
  #  customer = JSON.parse(response.body)
  #
  #  expect(response).to be_successful
  # end

  it 'can find a single object with any attribute' do
    name = create(:customer).first_name

    get "/api/v1/customers/find?name=#{name}"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["data"]["attributes"]["first_name"]).to eq(name)
  end

  it 'can find a single object with any attribute' do
    name = create(:customer).last_name

    get "/api/v1/customers/find?name=#{name}"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(name).to eq(customer["data"]["attributes"]["last_name"])
  end

  it 'can find a single object with any attribute' do
    id = create(:customer).id

    get "/api/v1/customers/find?id=#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["data"]["attributes"]["id"]).to eq(id)
  end

  # it 'can find a single object with any attribute' do
  #   tay = Customer.create!(first_name: "tay", last_name: "deherrera", updated_at: "2019-08-13T00:00:000Z")
  #
  #   get "/api/v1/customers/find?updated_at=#{tay.updated_at}"
  #
  #   customer = JSON.parse(response.body)
  #   binding.pry
  #   expect(response).to be_successful
  #   expect(tay["updated_at"]).to eq(customer["data"]["attributes"]["updated_at"])
  # end
  #
  # it 'can find a single object with any attribute' do
  #   tay = Customer.create!(first_name: "tay", last_name: "deherrera", updated_at: "2019-08-13T00:00:000Z")
  #
  #   get "/api/v1/customers/find?created_at=2019-08-13 00:00:00.000000000"
  #
  #   customer = JSON.parse(response.body)
  #
  #   expect(response).to be_successful
  #   expect(tay["created_at"]).to eq(customer["data"]["attributes"]["created_at"])
  # end
end

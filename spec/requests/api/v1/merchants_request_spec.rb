require 'rails_helper'

describe 'Merchants API' do
  it 'sends a list of Merchants' do
    create_list(:merchant, 5)

    get '/api/v1/merchants'

    expect(response).to be_success

    merchants = JSON.parse(response.body)

    expect(merchants["data"].count).to eq(5)
  end

  it "can get one merchant by its id" do
   id = create(:merchant).id

   get "/api/v1/merchants/#{id}"

   merchant = JSON.parse(response.body)

   expect(response).to be_successful
   expect(merchant["data"]["id"].to_i).to eq(id)
  end

  it 'can find a single object with any attribute' do
    name = create(:merchant).name

    get "/api/v1/merchants/find?name=#{name}"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(name).to eq(merchant["data"]["attributes"]["name"])
  end

  it 'can find a single object with any attribute' do
    id = create(:merchant).id

    get "/api/v1/merchants/find?id=#{id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["data"]["attributes"]["id"]).to eq(id)
  end

  it 'can find a single object with any attribute' do
    tay = Merchant.create!(name: "tay", updated_at: "2019-08-13T00:00:000Z")

    get "/api/v1/merchants/find?updated_at=2019-08-13T00:00:000Z"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(tay["updated_at"]).to eq(merchant["data"]["attributes"]["updated_at"])
  end

  it 'can find a single object with any attribute' do
    aurie = Merchant.create!(name: "aurie", created_at: "2019-08-13 00:00:00.000000000")

    get "/api/v1/merchants/find?created_at=2019-08-13 00:00:00.000000000"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(aurie["created_at"]).to eq(merchant["data"]["attributes"]["created_at"])
  end

  it 'can find most revenue' do
    tay = Merchant.create!(name: "tay")
    stella = Merchant.create!(name: "stella")
    avi = Merchant.create!(name: "avi")

    get "/api/v1/merchants/most_revenue?quantity=3"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(Merchant.count).to eq(3)
  end

  it 'can find most revenue by date' do
    tay = Merchant.create!(name: "tay")
    stella = Merchant.create!(name: "stella")
    avi = Merchant.create!(name: "avi")

    get "/api/v1/merchants/most_revenue?date=2012-03-16"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
  end

  it 'can find most number of items sold' do
    tay = Merchant.create!(name: "tay")
    stella = Merchant.create!(name: "stella")
    avi = Merchant.create!(name: "avi")

    get "/api/v1/merchants/revenue?date=2012-03-16"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
  end
  it 'can find total revenue for specific merchant' do
    tay = Merchant.create!(name: "tay")

    get "/api/v1/merchants/#{tay.id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
  end

  it 'can find total revenue for specific merchant by date' do
    tay = Merchant.create!(name: "tay")
    stella = Merchant.create!(name: "stella")
    avi = Merchant.create!(name: "avi")

    get "/api/v1/merchants/#{tay.id}/revenue?date=2012-03-16"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
  end

  it "can find specific merchant's fav customer by most items sold" do
    tay = Merchant.create!(name: "tay")

    get "/api/v1/merchants/#{tay.id}/favorite_customer"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
  end
end

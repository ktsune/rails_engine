require 'rails_helper'

describe 'Items API' do
  it 'sends a list of Items' do
    create_list(:item, 5)

    get '/api/v1/items'

    expect(response).to be_success

    items = JSON.parse(response.body)
    expect(items["data"].count).to eq(5)
  end

  it "can get one item by its id" do
   id = create(:item).id

   get "/api/v1/items/#{id}"

   item = JSON.parse(response.body)

   expect(response).to be_successful
   expect(item["data"]["id"].to_i).to eq(id)
  end

  it 'gets items with highest revenue based on quantity input' do
    create_list(:item, 5)

    get '/api/v1/items/most_revenue?quantity=3'

    expect(response).to be_success

    items = JSON.parse(response.body)
  end

  it 'finds highest occurance of items based on quantity param' do
    create_list(:item, 5)

    get '/api/v1/items/most_items?quantity=3'

    expect(response).to be_success

    items = JSON.parse(response.body)
  end

  it 'returns date with most sales for given item using invoice date' do
    create_list(:item, 5)
    id = create(:item).id

    get "/api/v1/items/#{id}/best_day"

    expect(response).to be_success

    items = JSON.parse(response.body)
  end

  it 'can find a single object with any attribute' do
    name = create(:item).name

    get "/api/v1/items/find?name=#{name}"

    item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(name).to eq(item["data"]["attributes"]["name"])
  end

  it 'can find a single object with any attribute' do
    id = create(:item).id

    get "/api/v1/items/find?id=#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(item["data"]["attributes"]["id"]).to eq(id)
  end

  # it 'can find a single object with any attribute' do
  #   alex = Merchant.create(name: "alex")
  #   tay = Item.create!(name: "tay", updated_at: "2019-08-13T00:00:000Z", merchant_id: alex.id)
  #
  #   get "/api/v1/items/find?updated_at=2019-08-13T00:00:000Z"
  #
  #   item = JSON.parse(response.body)
  #
  #   expect(response).to be_successful
  #   expect(tay["updated_at"]).to eq(item["data"]["attributes"]["updated_at"])
  # end
  #
  # it 'can find a single object with any attribute' do
  #   alex = Merchant.create(name: "alex")
  #   aurie = Item.create!(name: "aurie", created_at: "2019-08-13 00:00:00.000000000", merchant_id: alex.id)
  #
  #   get "/api/v1/items/find?created_at=2019-08-13 00:00:00.000000000"
  #
  #   item = JSON.parse(response.body)
  #
  #   expect(response).to be_successful
  #   expect(aurie["created_at"]).to eq(item["data"]["attributes"]["created_at"])
  # end
end

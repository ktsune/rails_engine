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
    merchant = create(:merchant)

    get "/api/v1/merchants/find?name=#{merchant.name}"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["data"]["name"]).to eq(name)

    get "/api/v1/merchants/find?id=#{merchant.id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["data"]["id"]).to eq(id)
    #
    # get "/api/v1/merchants/find?updated_at=#{merchant.updated_at}"
    #
    # merchant = JSON.parse(response.body)
    #
    # expect(response).to be_successful
    # expect(merchant["data"]["updated_at"]).to eq(updated_at)
    #
    # get "/api/v1/merchants/find?created_at=#{merchant.created_at}"
    #
    # merchant = JSON.parse(response.body)
    #
    # expect(response).to be_successful
    # expect(merchant["data"]["created_at"]).to eq(created_at)
  end
end

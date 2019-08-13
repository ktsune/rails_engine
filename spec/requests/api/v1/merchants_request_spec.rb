require 'rails_helper'

describe 'Merchants API' do
  it 'sends a list of Merchants' do
    create_list(:merchant, 5)

    get '/api/v1/merchants'

    expect(response).to be_success

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(5)
  end

  it "can get one merchant by its id" do
   id = create(:merchant).id

   get "/api/v1/merchants/#{id}"

   merchant = JSON.parse(response.body)

   expect(response).to be_successful
   expect(merchant["id"]).to eq(id)
 end
end

require 'rails_helper'

describe 'Transactions API' do
  it 'sends a list of Transactions' do
    tay = Merchant.create!(name: "tay")
    tay = Merchant.create!(name: "tay")
    customer_1 = Customer.create!(first_name: 'alex', last_name: 'bison')
    customer_1 = Customer.create!(first_name: 'alex', last_name: 'bison')
    invoice_1 = Invoice.create!(merchant_id: tay.id, customer_id: customer_1.id )
    invoice_1 = Invoice.create!(merchant_id: tay.id, customer_id: customer_1.id )
    t_1 = Transaction.create!(credit_card_number: "1234 1234 1234 1234", updated_at: "2019-08-13T00:00:000Z", invoice_id: invoice_1.id)
    t_1 = Transaction.create!(credit_card_number: "1234 1234 1234 1234", updated_at: "2019-08-13T00:00:000Z", invoice_id: invoice_1.id)


    get '/api/v1/transactions'

    expect(response).to be_success

    transactions = JSON.parse(response.body)

    expect(transactions["data"].count).to eq(2)
  end

  it "can get one transaction by its id" do
    tay = Merchant.create!(name: "tay")
    customer_1 = Customer.create!(first_name: 'alex', last_name: 'bison')
    invoice_1 = Invoice.create!(merchant_id: tay.id, customer_id: customer_1.id )
    t_1 = Transaction.create!(credit_card_number: "1234 1234 1234 1234", updated_at: "2019-08-13T00:00:000Z", invoice_id: invoice_1.id)

   get "/api/v1/transactions/#{t_1.id}"

   transaction = JSON.parse(response.body)

   expect(response).to be_successful
   expect(transaction["data"]["id"].to_i).to eq(t_1.id)
  end

  it 'can find a single object with any attribute' do
    tay = Merchant.create!(name: "tay")
    customer_1 = Customer.create!(first_name: 'alex', last_name: 'bison')
    invoice_1 = Invoice.create!(merchant_id: tay.id, customer_id: customer_1.id )
    t_1 = Transaction.create!(credit_card_number: "1234 1234 1234 1234", updated_at: "2019-08-13T00:00:000Z", invoice_id: invoice_1.id)

    get "/api/v1/transactions/find?credit_card_number=#{t_1.credit_card_number}"

    transaction = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transaction["data"]["attributes"]["credit_card_number"]).to eq(t_1.credit_card_number)
  end

  it 'can find a single object with any attribute' do
    tay = Merchant.create!(name: "tay")
    customer_1 = Customer.create!(first_name: 'alex', last_name: 'bison')
    invoice_1 = Invoice.create!(merchant_id: tay.id, customer_id: customer_1.id )
    t_1 = Transaction.create!(result: "success", updated_at: "2019-08-13T00:00:000Z", invoice_id: invoice_1.id)


    get "/api/v1/transactions/find?result=#{t_1.result}"

    transaction = JSON.parse(response.body)

    expect(response).to be_successful
    expect(t_1.result).to eq(transaction["data"]["attributes"]["result"])
  end

  it 'can find a single object with any attribute' do
    tay = Merchant.create!(name: "tay")
    customer_1 = Customer.create!(first_name: 'alex', last_name: 'bison')
    invoice_1 = Invoice.create!(merchant_id: tay.id, customer_id: customer_1.id )
    t_1 = Transaction.create!(credit_card_number: "1234 1234 1234 1234", updated_at: "2019-08-13T00:00:000Z", invoice_id: invoice_1.id)

    get "/api/v1/transactions/find?id=#{t_1.id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transaction["data"]["attributes"]["id"]).to eq(t_1.id)
  end

  it 'can find a single object with any attribute' do
    tay = Merchant.create!(name: "tay")
    customer_1 = Customer.create!(first_name: 'alex', last_name: 'bison')
    invoice_1 = Invoice.create!(merchant_id: tay.id, customer_id: customer_1.id )
    t_1 = Transaction.create!(updated_at: "2019-08-13T00:00:000Z", invoice_id: invoice_1.id)

    get "/api/v1/transactions/find?updated_at=2019-08-13T00:00:000Z"

    transaction = JSON.parse(response.body)

    expect(response).to be_successful
    expect(t_1["updated_at"]).to eq(transaction["data"]["attributes"]["updated_at"])
  end

  it 'can find a single object with any attribute' do
    tay = Merchant.create!(name: "tay")
    customer_1 = Customer.create!(first_name: 'alex', last_name: 'bison')
    invoice_1 = Invoice.create!(merchant_id: tay.id, customer_id: customer_1.id )
    t_1 = Transaction.create!(updated_at: "2019-08-13T00:00:000Z", invoice_id: invoice_1.id)

    get "/api/v1/transactions/find?created_at=2019-08-13 00:00:00.000000000"

    transaction = JSON.parse(response.body)

    expect(response).to be_successful
    expect(t_1["created_at"]).to eq(transaction["data"]["attributes"]["created_at"])
  end
end

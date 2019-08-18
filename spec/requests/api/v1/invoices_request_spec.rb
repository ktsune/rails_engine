require 'rails_helper'

describe 'Invoices API' do
  it 'sends a list of Invoices' do
    tay = Merchant.create!(name: "tay")
    tay = Merchant.create!(name: "tay")
    customer_1 = Customer.create!(first_name: 'alex', last_name: 'bison')
    customer_1 = Customer.create!(first_name: 'alex', last_name: 'bison')
    i_1 = Invoice.create!(merchant_id: tay.id, customer_id: customer_1.id )
    i_1 = Invoice.create!(merchant_id: tay.id, customer_id: customer_1.id )
    t_1 = Transaction.create!(credit_card_number: "1234 1234 1234 1234", updated_at: "2019-08-13T00:00:000Z", invoice_id: i_1.id)
    t_1 = Transaction.create!(credit_card_number: "1234 1234 1234 1234", updated_at: "2019-08-13T00:00:000Z", invoice_id: i_1.id)

    get '/api/v1/invoices'

    expect(response).to be_success

    invoices = JSON.parse(response.body)

    expect(invoices["data"].count).to eq(2)
  end

  it "can get one invoice by its id" do
    tay = Merchant.create!(name: "tay")
    customer_1 = Customer.create!(first_name: 'alex', last_name: 'bison')
    i_1 = Invoice.create!(merchant_id: tay.id, customer_id: customer_1.id )
    t_1 = Transaction.create!(credit_card_number: "1234 1234 1234 1234", updated_at: "2019-08-13T00:00:000Z", invoice_id: i_1.id)

   get "/api/v1/invoices/#{i_1.id}"

   invoice = JSON.parse(response.body)

   expect(response).to be_successful
   expect(invoice["data"]["id"].to_i).to eq(i_1.id)
  end

  it 'can find a single object with any attribute' do
    tay = Merchant.create!(name: "tay")
    customer_1 = Customer.create!(first_name: 'alex', last_name: 'bison')
    i_1 = Invoice.create!(status: "shipped", merchant_id: tay.id, customer_id: customer_1.id )
    t_1 = Transaction.create!(credit_card_number: "1234 1234 1234 1234", updated_at: "2019-08-13T00:00:000Z", invoice_id: i_1.id)

    get "/api/v1/invoices/find?credit_card_number=#{i_1.status}"

    invoice = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice["data"]["attributes"]["status"]).to eq(i_1.status)
  end

  it 'can find a single object with any attribute' do
    tay = Merchant.create!(name: "tay")
    customer_1 = Customer.create!(first_name: 'alex', last_name: 'bison')
    i_1 = Invoice.create!(merchant_id: tay.id, customer_id: customer_1.id )
    t_1 = Transaction.create!(credit_card_number: "1234 1234 1234 1234", updated_at: "2019-08-13T00:00:000Z", invoice_id: i_1.id)

    get "/api/v1/invoices/find?id=#{i_1.id}"

    invoice = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice["data"]["attributes"]["id"]).to eq(i_1.id)
  end

  it 'can find a single object with any attribute' do
    tay = Merchant.create!(name: "tay")
    customer_1 = Customer.create!(first_name: 'alex', last_name: 'bison')
    i_1 = Invoice.create!(merchant_id: tay.id, customer_id: customer_1.id )
    t_1 = Transaction.create!(updated_at: "2019-08-13T00:00:000Z", invoice_id: i_1.id)

    get "/api/v1/invoices/find?updated_at=2019-08-13T00:00:000Z"

    invoice = JSON.parse(response.body)

    expect(response).to be_successful
    expect(t_1["updated_at"]).to eq(invoice["data"]["attributes"]["updated_at"])
  end

  it 'can find a single object with any attribute' do
    tay = Merchant.create!(name: "tay")
    customer_1 = Customer.create!(first_name: 'alex', last_name: 'bison')
    i_1 = Invoice.create!(merchant_id: tay.id, customer_id: customer_1.id )
    t_1 = Transaction.create!(updated_at: "2019-08-13T00:00:000Z", invoice_id: i_1.id)

    get "/api/v1/invoices/find?created_at=2019-08-13 00:00:00.000000000"

    invoice = JSON.parse(response.body)

    expect(response).to be_successful
    expect(t_1["created_at"]).to eq(invoice["data"]["attributes"]["created_at"])
  end
end

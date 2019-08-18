require 'rails_helper'

describe 'Invoices API' do
  it 'sends a list of Invoices' do
    tay = Merchant.create!(name: "tay")
    customer_1 = Customer.create!(first_name: 'alex', last_name: 'bison')
    invoice_1 = Invoice.create!(merchant_id: tay.id, customer_id: customer_1.id )
    t_1 = Transaction.create!(credit_card_number: "1234 1234 1234 1234", updated_at: "2019-08-13T00:00:000Z", invoice_id: invoice_1.id)
    mustard = Item.create!(name: "mustard", description: "yellow", unit_price: 20, merchant_id: tay.id)
    ketchup = Item.create!(name: "ketchup", description: "red", unit_price: 10, merchant_id: tay.id)
    invoice_item_1 = ketchup.invoice_items.create!(quantity: 1, unit_price: 10, invoice_id: invoice_1.id, item_id: ketchup.id)
    invoice_item_2 = mustard.invoice_items.create!(quantity: 1, unit_price: 20, invoice_id: invoice_1.id, item_id: mustard.id)

    get '/api/v1/invoice_items'

    invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_items["data"].count).to eq(2)
  end

  it "can get one invoice by its id" do
    tay = Merchant.create!(name: "tay")
    customer_1 = Customer.create!(first_name: 'alex', last_name: 'bison')
    invoice_1 = Invoice.create!(merchant_id: tay.id, customer_id: customer_1.id )
    t_1 = Transaction.create!(credit_card_number: "1234 1234 1234 1234", updated_at: "2019-08-13T00:00:000Z", invoice_id: invoice_1.id)
    ketchup = Item.create!(name: "ketchup", description: "red", unit_price: 10, merchant_id: tay.id)
    invoice_item_1 = ketchup.invoice_items.create!(quantity: 1, unit_price: 10, invoice_id: invoice_1.id, item_id: ketchup.id)

   get "/api/v1/invoice_items/#{invoice_item_1.id}"

   invoice_item = JSON.parse(response.body)

   expect(response).to be_successful
   expect(invoice_item["data"]["id"].to_i).to eq(invoice_item_1.id)
  end

  it 'can find a single object with any attribute' do
    tay = Merchant.create!(name: "tay")
    customer_1 = Customer.create!(first_name: 'alex', last_name: 'bison')
    invoice_1 = Invoice.create!(status: "shipped", merchant_id: tay.id, customer_id: customer_1.id )
    t_1 = Transaction.create!(credit_card_number: "1234 1234 1234 1234", updated_at: "2019-08-13T00:00:000Z", invoice_id: invoice_1.id)
    ketchup = Item.create!(name: "ketchup", description: "red", unit_price: 10, merchant_id: tay.id)
    invoice_item_1 = ketchup.invoice_items.create!(quantity: 1, unit_price: 10, invoice_id: invoice_1.id, item_id: ketchup.id)

    get "/api/v1/invoice_items/find?quantity=#{invoice_item_1.quantity}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_item["data"]["attributes"]["quantity"]).to eq(invoice_item_1.quantity)
  end

  it 'can find a single object with any attribute' do
    tay = Merchant.create!(name: "tay")
    customer_1 = Customer.create!(first_name: 'alex', last_name: 'bison')
    invoice_1 = Invoice.create!(status: "shipped", merchant_id: tay.id, customer_id: customer_1.id )
    t_1 = Transaction.create!(credit_card_number: "1234 1234 1234 1234", updated_at: "2019-08-13T00:00:000Z", invoice_id: invoice_1.id)
    ketchup = Item.create!(name: "ketchup", description: "red", unit_price: 10, merchant_id: tay.id)
    invoice_item_1 = ketchup.invoice_items.create!(quantity: 1, unit_price: 10, invoice_id: invoice_1.id, item_id: ketchup.id)

    get "/api/v1/invoice_items/find?unit_price=#{invoice_item_1.unit_price}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_item["data"]["attributes"]["unit_price"]).to eq(invoice_item_1.unit_price)
  end

  it 'can find a single object with any attribute' do
    tay = Merchant.create!(name: "tay")
    customer_1 = Customer.create!(first_name: 'alex', last_name: 'bison')
    invoice_1 = Invoice.create!(merchant_id: tay.id, customer_id: customer_1.id )
    t_1 = Transaction.create!(credit_card_number: "1234 1234 1234 1234", updated_at: "2019-08-13T00:00:000Z", invoice_id: invoice_1.id)
    ketchup = Item.create!(name: "ketchup", description: "red", unit_price: 10, merchant_id: tay.id)
    invoice_item_1 = ketchup.invoice_items.create!(quantity: 1, unit_price: 10, invoice_id: invoice_1.id, item_id: ketchup.id)

    get "/api/v1/invoice_items/find?id=#{invoice_item_1.id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_item["data"]["attributes"]["id"]).to eq(invoice_item_1.id)
  end

  # it 'can find a single object with any attribute' do
  #   tay = Merchant.create!(name: "tay")
  #   customer_1 = Customer.create!(first_name: 'alex', last_name: 'bison')
  #   invoice_1 = Invoice.create!(merchant_id: tay.id, customer_id: customer_1.id )
  #   t_1 = Transaction.create!(updated_at: "2019-08-13T00:00:000Z", invoice_id: invoice_1.id)
  #   ketchup = Item.create!(name: "ketchup", description: "red", unit_price: 10, merchant_id: tay.id)
  #   invoice_item_1 = ketchup.invoice_items.create!(quantity: 1, unit_price: 10, updated_at: "Tue, 13 Aug 2019 00:00:00 UTC +00:00", invoice_id: invoice_1.id, item_id: ketchup.id)
  #
  #   get "/api/v1/invoice_items/find?updated_at=#{invoice_item_1.updated_at}"
  #
  #   invoice_item = JSON.parse(response.body)
  #
  #   expect(response).to be_successful
  #   expect(invoice_item["data"]["attributes"]["updated_at"]).to eq(invoice_1.updated_at)
  # end
  #
  # it 'can find a single object with any attribute' do
  #   tay = Merchant.create!(name: "tay")
  #   customer_1 = Customer.create!(first_name: 'alex', last_name: 'bison')
  #   invoice_1 = Invoice.create!(merchant_id: tay.id, customer_id: customer_1.id )
  #   t_1 = Transaction.create!(updated_at: "2019-08-13T00:00:000Z", invoice_id: invoice_1.id)
  #   ketchup = Item.create!(name: "ketchup", description: "red", unit_price: 10, merchant_id: tay.id)
  #   invoice_item_1 = ketchup.invoice_items.create!(quantity: 1, unit_price: 10, created_at: "2019-08-13T00:00:000Z", invoice_id: invoice_1.id, item_id: ketchup.id)
  #
  #   get "/api/v1/invoice_items/find?created_at=#{invoice_item_1.created_at}"
  # 
  #   invoice_item = JSON.parse(response.body)
  #
  #   expect(response).to be_successful
  #   expect(invoice_item_1.created_at).to eq(invoice_item["data"]["attributes"]["created_at"])
  # end
end

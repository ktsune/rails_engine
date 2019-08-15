require 'rails_helper'

RSpec.describe Merchant, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :items}
    it {should have_many :invoices}
  end

  it 'can find the top x merchants by revenue' do
    tay = Merchant.create!(name: "tay")
    stella = Merchant.create!(name: "stella")
    avi = Merchant.create!(name: "avi")

    ketchup = Item.create(name: "ketchup", description: "red", unit_price: 10, merchant_id: tay.id)
    mustard = Item.create(name: "mustard", description: "yellow", unit_price: 20, merchant_id: stella.id)
    ranch = Item.create(name: "ranch", description: "white", unit_price: 30, merchant_id: avi.id)

    invoice_1 = Invoice.create(status: "shipped")

    invoice_item_1 = ketchup.invoice_items.create(invoice_id: invoice_1, quantity: 1, unit_price: 10)
    invoice_item_2 = mustard.invoice_items.create(quantity: 1, unit_price: 20)
    invoice_item_3 = ranch.invoice_items.create(quantity: 1, unit_price: 30)

    get "/api/v1/merchants/most_revenue?quantity=3"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(Merchant.most_revenue).to eq(avi.name)
  end
end

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

    customer_1 = Customer.create!(first_name: 'alex', last_name: 'bison')
    customer_2 = Customer.create!(first_name: 'byron', last_name: 'lee')
    customer_3 = Customer.create!(first_name: 'jake', last_name: 'miller')

    ketchup = Item.create!(name: "ketchup", description: "red", unit_price: 10, merchant_id: tay.id)
    mustard = Item.create!(name: "mustard", description: "yellow", unit_price: 20, merchant_id: stella.id)
    ranch = Item.create!(name: "ranch", description: "white", unit_price: 30, merchant_id: avi.id)

    invoice_1 = Invoice.create!(merchant_id: tay.id, customer_id: customer_1.id )
    invoice_2 = Invoice.create!(merchant_id: stella.id, customer_id: customer_2.id )
    invoice_3 = Invoice.create!(merchant_id: avi.id, customer_id: customer_3.id )

    transaction_1 = Transaction.create!(credit_card_number: "1234 1234 1234 1234", result: "success", invoice_id: invoice_1.id)
    transaction_2 = Transaction.create!(credit_card_number: "1234 1234 1234 1234", result: "success", invoice_id: invoice_2.id)
    transaction_3 = Transaction.create!(credit_card_number: "1234 1234 1234 1234", result: "success", invoice_id: invoice_3.id)

    invoice_item_1 = ketchup.invoice_items.create!(quantity: 1, unit_price: 10, invoice_id: invoice_1.id, item_id: ketchup.id)
    invoice_item_2 = mustard.invoice_items.create!(quantity: 1, unit_price: 20, invoice_id: invoice_2.id, item_id: mustard.id)
    invoice_item_3 = ranch.invoice_items.create!(quantity: 1, unit_price: 30, invoice_id: invoice_3.id, item_id: ranch.id)

    expect(Merchant.most_revenue(3)).to eq([avi, stella, tay])
  end

  it 'can find most revenue by date' do
    tay = Merchant.create!(name: "tay")
    stella = Merchant.create!(name: "stella")
    avi = Merchant.create!(name: "avi")
  end
end

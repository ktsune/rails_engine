require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe 'validations' do
    it {should validate_presence_of :quantity}
    it {should validate_presence_of :unit_price}
  end

  describe 'relationships' do
    it {should belong_to :items}
    it {should belong_to :invoices}
  end
end

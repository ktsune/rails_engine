class Customer < ApplicationRecord
  validates_presence_of :first_name,
                        :last_name
  has_many :invoices

  def favorite_merchant(id)
    invoices.joins('JOIN merchants ON invoices.merchant_id = merchants.id')
      .joins(:transactions)
      .where('transactions.result = ?', 'success')
      .select('merchants.*, COUNT(transactions.id) AS count')
      .group('merchants.id')
      .order('count DESC')
      .first
  end
end

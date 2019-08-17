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

  # Customer.joins(:invoices).joins("Join merchants ON invoices.merchant_id = merchants.id").joins("Join transactions ON invoices.id = transactions.invoice_id").select("merchants.*, count(invoices.merchant_id)").where(transactions: {result: "success"}).where(invoices: [customer_id:customer_id (1)]).group("merchants.id").limit(1)
end

# customer.invoices.joins('JOIN merchants ON invoices.merchant_id = merchants.id').joins(:transactions).where('transactions.result = ?', 'success').select('merchants.*, COUNT(transactions.id) AS count').group('merchants.id').order('count DESC')

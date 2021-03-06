class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :transactions

  def self.most_revenue(quantity)
    Merchant.joins(:invoices)
      .joins("JOIN invoice_items ON invoices.id = invoice_items.invoice_id")
      .joins("JOIN transactions ON invoices.id = transactions.invoice_id")
      .select("merchants.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue")
      .where("transactions.result = ?", "success")
      .group(:id).order("revenue desc")
      .limit(quantity)
  end

  def self.most_revenue_for_date(date)
    Invoice.joins(:invoice_items, :transactions)
      .where("transactions.result=?", "success")
      .where({invoices:{created_at: (date.to_date.all_day)}})
      .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def self.most_items_sold(quantity)
    Merchant.joins(:invoices)
      .joins("JOIN invoice_items ON invoices.id = invoice_items.invoice_id")
      .joins("JOIN transactions ON invoices.id = transactions.invoice_id")
      .select('merchants.*, SUM(invoice_items.quantity) AS count')
      .group('merchants.id')
      .order('count DESC')
      .limit(quantity)
      .where("transactions.result = ?", 'success')
  end

  def revenue(id)
    Merchant.joins(:invoices)
      .joins("JOIN invoice_items ON invoices.id = invoice_items.invoice_id")
      .joins("JOIN transactions ON invoices.id = transactions.invoice_id")
      .where("transactions.result = ?", "success")
      .where("merchants.id = ?", id)
      .group(:id)
      .sum("invoice_items.quantity * invoice_items.unit_price")[id.to_i]
  end

  def favorite_customer(id)
    invoices.joins('JOIN customers ON invoices.customer_id = customers.id')
      .joins(:transactions)
      .where('transactions.result = ?', 'success')
      .select('customers.*, COUNT(transactions.id) AS count')
      .group('customers.id')
      .order('count DESC')
      .first
  end

  def total_revenue_for_date(date)
    invoices.joins(:invoice_items, :transactions)
      .where("transactions.result=?", "success")
      .where({invoices:{created_at: (date.to_date.all_day)}})
      .sum("invoice_items.quantity * invoice_items.unit_price")
  end
end

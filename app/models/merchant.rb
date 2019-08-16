class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :transactions

  def self.most_revenue(quantity)
    Merchant.joins(:invoices)
    .joins("Join invoice_items ON invoices.id = invoice_items.invoice_id")
    .joins("Join transactions ON invoices.id = transactions.invoice_id")
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
    .joins("Join invoice_items ON invoices.id = invoice_items.invoice_id")
    .joins("Join transactions ON invoices.id = transactions.invoice_id")
    .select('merchants.*, SUM(invoice_items.quantity) AS count')
    .group('merchants.id')
    .order('count DESC')
    .limit(quantity)
    .where("transactions.result = ?", 'success')
  end

  def revenue
    binding.pry
  end
end

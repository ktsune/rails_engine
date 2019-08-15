class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoices

  def self.most_revenue(quantity)
    Merchant.joins(:invoices)
    .joins("Join invoice_items ON invoices.id = invoice_items.invoice_id")
    .joins("Join transactions ON invoices.id = transactions.invoice_id")
    .select("merchants.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue")
    .where("transactions.result = ?", "success")
    .group(:id).order("revenue desc").limit(quantity)
  end
end

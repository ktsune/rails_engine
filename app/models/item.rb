class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates_presence_of :name,
                        :description,
                        :unit_price

  def self.most_revenue(quantity)
    Item.joins(:invoices)
    .joins("Join invoice_items ON invoices.id = invoice_items.invoice_id")
    .joins("Join transactions ON invoices.id = transactions.invoice_id")
    .select("items.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue")
    .where("transactions.result = ?", "success")
    .group(:id).order("revenue desc")
    .limit(quantity)
  end

  def self.most_items(quantity)
    Item.joins(:invoices)
    .joins("Join invoice_items ON invoices.id = invoice_items.invoice_id")
    .joins("Join transactions ON invoices.id = transactions.invoice_id")
    .select('items.*, SUM(invoice_items.quantity) AS count')
    .group('id')
    .order('count DESC')
    .limit(quantity)
    .where("transactions.result = ?", 'success')
  end

  def self.most_revenue_for_date(date)
    Invoice.joins(:invoice_items, :transactions)
    .where("transactions.result=?", "success")
    .where({invoices:{created_at: (date.to_date.all_day)}})
    .sum("invoice_items.quantity * invoice_items.unit_price")
  end
end

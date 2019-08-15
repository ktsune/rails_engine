# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require 'csv'
require_relative 'config/application'

Rails.application.load_tasks


desc "Import merchants from csv file"
task :import => [:environment] do

  file = "./csv/merchants.csv"
  merchants = []

  CSV.foreach(file, :headers => true) do |row|
    merchants << row.to_h
  end
  Merchant.import(merchants)

  file = "./csv/items.csv"
  items = []

  CSV.foreach(file, :headers => true) do |row|
    items << row.to_h
  end
  Item.import(items)

  file = "./csv/customers.csv"
  customers = []

  CSV.foreach(file, :headers => true) do |row|
    customers << row.to_h
  end
  Customer.import(customers)

  file = "./csv/invoices.csv"
  invoices = []

  CSV.foreach(file, :headers => true) do |row|
    invoices << row.to_h
  end
  Invoice.import(invoices)

  file = "./csv/transactions.csv"
  transactions = []

  CSV.foreach(file, :headers => true) do |row|
    transactions << row.to_h
  end
  Transaction.import(transactions)

  file = "./csv/invoice_items.csv"
  invoice_items = []

  CSV.foreach(file, :headers => true) do |row|
    invoice_items << row.to_h
  end
  InvoiceItem.import(invoice_items)
end

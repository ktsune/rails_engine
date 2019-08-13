# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require 'csv'
require_relative 'config/application'

Rails.application.load_tasks


desc "Import merchants from csv file"
task :import_merchants => [:environment] do

  file = "./csv/merchants.csv"
  merchants = []

  CSV.foreach(file, :headers => true) do |row|
    merchants << Merchant.new(
      id: row[0],
      name: row[1],
      created_at: row[2],
      updated_at: row[3]
    )
    # Merchant.create!(
    #   :id => row[0],
    #   :name => row[1],
    #   :created_at => row[2],
    #   :updated_at => row[3]
    # )
  end
end

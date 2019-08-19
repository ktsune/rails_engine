class Api::V1::Customers::CustomerRelationsController < ApplicationController
  def index
    customer = Customer.find(params[:id])
    render json: TransactionSerializer.new(customer.customer_transactions)
  end

  def show
    customer = Customer.find(params[:id])
    render json: InvoiceSerializer.new(customer.invoices)
  end
end

class Api::V1::Invoices::RelationsController < ApplicationController
  def index
    invoice = Invoice.find(params[:id])
    render json: TransactionSerializer.new(invoice.transactions)
  end

  def show
    invoice = Invoice.find(params[:id])
    render json: ItemSerializer.new(invoice.invoices_items)
  end
end

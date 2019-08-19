class Api::V1::Transactions::InvoiceController < ApplicationController
  def index
  end

  def show
    transaction = Transaction.find(params[:id])
    invoice = Invoice.find(transaction.invoice_id)
    render json: InvoiceSerializer.new(invoice)
  end
end

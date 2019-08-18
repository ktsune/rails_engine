class Api::V1::Transactions::InvoiceController < ApplicationController
  def index
  end

  def show
    transaction = Transaction.find(params[:id])
    binding.pry
    render json: InvoiceSerializer.new(transaction.invoice)
  end
end

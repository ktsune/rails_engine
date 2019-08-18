class Api::V1::Transactions::SearchController < ApplicationController

  def index
    render json: TransactionSerializer.new(Transaction.where(search_params(params)))
  end

  def show
    render json: TransactionSerializer.new(Transaction.find_by(search_params(params)))
  end

private
  def search_params(params)
    params.permit(:credit_card_number, :result, :id, :updated_at, :created_at, :invoice_id)
  end
end

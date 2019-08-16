class Api::V1::InvoiceItems::SearchController < ApplicationController

  def index
    render json: InvoiceItemSerializer.new(InvoiceItem.where(search_params(params)))
  end

  def show
    render json: InvoiceItemSerializer.new(InvoiceItem.find_by(search_params(params)))
  end

private
  def search_params(params)
    params.permit(:quantity, :unit_price, :id, :updated_at, :created_at)
  end
end

class Api::V1::InvoiceItems::SearchController < ApplicationController

  def index
    render json: InvoiceItemSerializer.new(InvoiceItem.order_with_id.where(search_params(params)))
  end

  def show
    render json: InvoiceItemSerializer.new(InvoiceItem.order_with_id.find_by(search_params(params)))
  end

private
  def search_params(params)
    params.permit(:quantity, :unit_price, :id, :updated_at, :created_at, :item_id, :invoice_id)
  end
end

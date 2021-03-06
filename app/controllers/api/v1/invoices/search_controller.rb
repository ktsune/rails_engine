class Api::V1::Invoices::SearchController < ApplicationController

  def index
    render json: InvoiceSerializer.new(Invoice.order_with_id.where(search_params(params)))
  end

  def show
    render json: InvoiceSerializer.new(Invoice.order_with_id.find_by(search_params(params)))
  end

private
  def search_params(params)
    params.permit(:status, :id, :updated_at, :created_at, :customer_id, :merchant_id)
  end
end

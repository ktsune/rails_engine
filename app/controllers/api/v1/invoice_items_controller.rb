class Api::V1::InvoiceItemsController < ApplicationController
  def index
    render json: InvoiceItemSerializer.new(InvoiceItem.all)
  end

  def show
    render json: InvoiceItemSerializer.new(InvoiceItem.find(params[:id]))
  end

  private

  def invoice_item_params
    params.permit(:id, :quantity, :unit_price, :created_at, :updated_at)
  end
end

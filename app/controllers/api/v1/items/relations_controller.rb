class Api::V1::Items::RelationController < ApplicationController
  def index
    item = Item.find(params[:id])
    merchant = Merchant.find(item.merchant_id)
    render json: MerchantSerializer.new(merchant)
  end

  def show
    # item = Item.find(params[:id])
    # render json: InvoiceItemSerializer.new()
  end
end

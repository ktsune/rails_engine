class Api::V1::Merchants::OneMerchantItemsController < ApplicationController
  def index
  end

  def show
    merchant = Merchant.find(params[:id])
    render json: ItemSerializer.new(merchant.items)
  end
end

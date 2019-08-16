class Api::V1::Merchants::ItemsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.most_items_sold(params[:quantity]))
  end

  def show
    binding.pry
    merchant = Merchant.find(params[:id])
    render json: MerchantSerializer.new(Merchant.revenue)
  end
end

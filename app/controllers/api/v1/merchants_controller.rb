class Api::V1::MerchantsController < ApplicationController

  def index
    render json: MerchantSerializer.new(Merchant.all)
  end

  def show
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
    # binding.pry
  end

private
  def merchant_params(params)
    params.permit(:name, :id, :created_at, :updated_at)
  end
end

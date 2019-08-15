class Api::V1::Merchants::RevenueController < ApplicationController
  def index
  end

  def show
    # binding.pry
    render json: MerchantSerializer.new(Merchant.most_revenue(num))
  end

private
  def merchant_params(params)
    params.permit(:name, :id, :updated_at, :created_at)
  end
end

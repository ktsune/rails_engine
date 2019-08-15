class Api::V1::Merchants::RevenueController < ApplicationController
  def index
  end

  def show
    render json: MerchantSerializer.new(Merchant.most_revenue(params[:quantity]))
  end

private
  def merchant_params(params)
    params.permit(:name, :id, :updated_at, :created_at)
  end
end

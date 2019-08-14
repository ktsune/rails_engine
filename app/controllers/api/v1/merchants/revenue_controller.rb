class Api::V1::Merchants::RevenueController < ApplicationController
  def index
  end

  def show
    render json: MerchantSerializer.new(Merchant.find_all(search_params(params)))
  end
end

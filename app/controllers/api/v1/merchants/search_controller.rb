class Api::V1::Merchants::SearchController < ApplicationController

  def index
    render json: MerchantSerializer.new(Merchant.find_all(search_params(params)))
  end

  def show
    render json: MerchantSerializer.new(Merchant.find_by(search_params(params)))
  end


private
  def search_params(params)
    params.permit(:name, :id, :updated_at, :created_at)
  end
end

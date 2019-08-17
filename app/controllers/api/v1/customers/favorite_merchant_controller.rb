class Api::V1::Customers::FavoriteMerchantController < ApplicationController
  def index
  end

  def show
    customer = Customer.find(params[:id])
    merchant_id = customer.favorite_merchant(params[:id]).id
    merchant = Merchant.find(merchant_id)
    render json: MerchantSerializer.new(merchant)
  end
end

class Api::V1::Merchants::ItemsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.most_items_sold(params[:quantity]))
  end

  def show
    merchant = Merchant.find(params[:id])
    customer_id = merchant.favorite_customer(params[:id]).id
    customer = Customer.find(customer_id)
    render json: CustomerSerializer.new(customer)
  end
end

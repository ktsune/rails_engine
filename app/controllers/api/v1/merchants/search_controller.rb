class Api::V1::Merchants::SearchController < ApplicationController
  # def index
  #   # => find all takes a parameter that is any attribute on merchant
  #   # => write a conditional for any attribute taken in
  #   if Merchant.find(params[:name])
  #     render json: MerchantSerializer.new(Merchant.find_all(name: params[:name])
  #   elsif Merchant.find(params[:id])
  #     render json: MerchantSerializer.new(Merchant.find_all(id: params[:id])
  #   elsif params[:created_at]
  #     render json: MerchantSerializer.new(Merchant.find_all(created_at: params[:created_at])
  #   elsif params[:updated_at]
  #     render json: MerchantSerializer.new(Merchant.find_all(updated_at: params[:updated_at])
  #   end
  #   merchant
  # end

  def show
    binding.pry
    if params[:name]
      merchant = render json: MerchantSerializer.new(Merchant.find_by(name: params[:name])
      elsif params[:id]
        merchant = render json: MerchantSerializer.new(Merchant.find_by(id: params[:id])
      elsif params[:created_at]
        merchant = render json: MerchantSerializer.new(Merchant.find_by(created_at: params[:created_at])
      elsif params[:updated_at]
        merchant = render json: MerchantSerializer.new(Merchant.find_by(updated_at: params[:updated_at])
    end
    merchant
  end
end

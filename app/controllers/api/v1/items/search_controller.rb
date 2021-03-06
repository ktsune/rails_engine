class Api::V1::Items::SearchController < ApplicationController

  def index
    render json: ItemSerializer.new(Item.order_with_id.where(search_params(params)))
  end

  def show
    render json: ItemSerializer.new(Item.order_with_id.find_by(search_params(params)))
  end

private
  def search_params(params)
    params.permit(:name, :description, :unit_price, :id, :updated_at, :created_at, :merchant_id)
  end
end

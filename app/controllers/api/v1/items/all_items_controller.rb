class Api::V1::Items::AllItemsController < ApplicationController

  def index
    render json: ItemSerializer.new(Item.most_revenue(params[:quantity]))
  end

  def show
  end
end

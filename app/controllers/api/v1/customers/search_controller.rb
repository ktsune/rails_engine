class Api::V1::Customers::SearchController < ApplicationController

  def index
    render json: CustomerSerializer.new(Customer.where(search_params(params)))
  end

  def show
    render json: CustomerSerializer.new(Customer.find_by(search_params(params)))
  end

private
  def search_params(params)
    params.permit(:first_name, :last_name, :id, :updated_at, :created_at)
  end
end

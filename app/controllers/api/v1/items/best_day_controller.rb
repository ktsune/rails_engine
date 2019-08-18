class Api::V1::Items::BestDayController < ApplicationController
  def index
  end

  def show
    item = Item.find(params[:id])
    render json: {"data" => {"attributes" => {"best_day" => item.best_day.to_date}}}
  end
end

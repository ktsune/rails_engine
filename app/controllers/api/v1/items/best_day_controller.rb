class Api::V1::Items::BestDayController < ApplicationController
  def index
  end

  def show
    # render :json ItemSerializer.new(Item.best_day(params[:date]))
  end
end

class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    total = Merchant.most_revenue_for_date(params[:date])
    float = "%.2f" % (total.to_f / 100)
    render json: {"data" => {"attributes" => {"total_revenue" => float}}}
  end

  def show
    render json: MerchantSerializer.new(Merchant.most_revenue(params[:quantity]))
  end
end

class Api::V1::Merchants::SingleMerchantRevenueController < ApplicationController
  def index
    total = Merchant.most_revenue_for_date(params[:date])
    float = "%.2f" % (total.to_f / 100)
    render json: {"data" => {"attributes" => {"total_revenue" => float}}}
  end

  def show
    if !params[:date]
      merchant = Merchant.find(params[:id])
      revenue = merchant.revenue(params[:id])
      float = "%.2f" % (revenue.to_f / 100)
      render json: {"data" => {"attributes" => {"revenue" => float}}}
    else
      merchant = Merchant.find(params[:id])
      total = merchant.total_revenue_for_date(params[:date])
      float = "%.2f" % (total.to_f / 100)
      render json: {"data" => {"attributes" => {"revenue" => float}}}
    end 
  end
end

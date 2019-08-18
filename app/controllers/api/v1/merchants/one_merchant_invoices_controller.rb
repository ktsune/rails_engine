class Api::V1::Merchants::OneMerchantInvoicesController < ApplicationController
  def index
  end

  def show
    merchant = Merchant.find(params[:id])
    render json: InvoiceSerializer.new(merchant.invoices)
  end
end

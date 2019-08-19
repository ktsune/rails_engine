class Api::V1::InvoiceItems::InvoiceItemRelationsController < ApplicationController
  def index
    invoice_item = InvoiceItem.find(params[:id])
    item = Item.find(invoice_item.item_id)
    render json: ItemSerializer.new(item)
  end

  def show
    invoice_item = InvoiceItem.find(params[:id])
    invoice = Invoice.find(invoice_item.invoice_id)
    render json: InvoiceSerializer.new(invoice)
  end
end

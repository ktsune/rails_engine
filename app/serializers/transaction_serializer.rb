class TransactionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :credit_card_number, :result, :invoice_id

  belongs_to :invoice
end

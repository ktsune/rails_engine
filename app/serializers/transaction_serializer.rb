class TransactionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :credit_card_number, :credit_card_expiration_date, :result, :invoice_id

  belongs_to :invoice
end

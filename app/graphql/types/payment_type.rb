module Types
  class PaymentType < Types::BaseObject
    field :id, ID, null: false
    field :amount, Float, null: false
    field :status, String, null: false
    field :order, Types::OrderType, null: false
  end
end

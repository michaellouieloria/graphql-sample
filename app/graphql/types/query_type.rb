module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :all_orders, [Types::OrderType], null: false

    field :payment, Types::PaymentType, null: false do
      description 'Find an payment by ID'
      argument :id, ID, required: true
    end

    def all_orders
        Order.all
    end

    def payment(id:)
      Payment.find(id)
    end
  end
end

# query {
#   allOrders {
#       description
#       total
#       payments {
#           amount
#       }
#   }
# }

# query {
#   payment(id: "1") {
#       id
#       amount
#       order {
#           id
#           total
#       }
#   }
# }

# query {
#   allOrders {
#       id
#       description
#       total
#       successfulPayments {
#           id
#           amount
#           status
#       }
#       paymentsCount
#   }
# }

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :items, [Types::ItemType], null: false, description: "Returns a list of items"
    def items
      Item.all
    end

    field :item, Types::ItemType, null: false do
      argument :id, ID, required: true
    end
    def item(id:)
      Item.find(id)
    end

    field :users, [Types::UserType], null: false, description: "Returns a list of users"
    def users
      User.all
    end
  end
end

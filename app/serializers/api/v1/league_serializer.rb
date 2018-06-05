module Api
  module V1
    class LeagueSerializer < ActiveModel::Serializer
      attributes :id, :name, :password, :key

      has_many :users, serializer: Api::V1::UserSerializer

      def users
        object.users.order(score: :desc)
      end
    end
  end
end

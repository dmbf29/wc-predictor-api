module Api
  module V1
    class LeagueSerializer < ActiveModel::Serializer
      attributes :id, :name, :password, :key, :users

      def users
        object.users.order(score: :desc)
      end
    end
  end
end

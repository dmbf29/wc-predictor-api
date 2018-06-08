module Api
  module V1
    class LeagueSerializer < ActiveModel::Serializer
      attributes :id, :name, :password, :key

      has_many :users, serializer: UserSerializer

      def users
        object.users.order(score: :desc)
      end

      # def matches
      #   object.matches.map do |match|
      #     MatchSerializer.new(match, scope: object).attributes
      #   end
      # end
    end
  end
end

module Api
  module V1
    class LeagueSerializer < ActiveModel::Serializer
      attributes :id, :name, :password, :key

      def key
        object.id + 100
      end
    end
  end
end

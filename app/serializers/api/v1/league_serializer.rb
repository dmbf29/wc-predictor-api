module Api
  module V1
    class LeagueSerializer < ActiveModel::Serializer
      attributes :id, :name, :password, :key
    end
  end
end

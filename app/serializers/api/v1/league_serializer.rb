module Api
  module V1
    class LeagueSerializer < ActiveModel::Serializer
      attributes :id, :name, :password, :key

      has_many :users
    end
  end
end

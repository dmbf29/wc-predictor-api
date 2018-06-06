module Api
  module V1
    class TeamSerializer < ActiveModel::Serializer
      embed :ids, include: true

      attributes :id,
                 :name,
                 :abbrev,
                 :badge,
                 :points,
                 :ranking
    end
  end
end

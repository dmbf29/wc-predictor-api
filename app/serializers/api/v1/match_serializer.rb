module Api
  module V1
    class MatchSerializer < ActiveModel::Serializer
      embed :ids, include: true

      attributes :id,
                 :team_home_score,
                 :team_away_score,
                 :finished,
                 :started

      has_one :team_home, serializer:  TeamSerializer, embed: :ids, include: false
      has_one :team_away, serializer:  TeamSerializer, embed: :ids, include: false
      has_one :group, serializer:  GroupSerializer, embed: :ids, include: false
      has_one :round, serializer:  RoundSerializer, embed: :ids, include: false
    end
  end
end

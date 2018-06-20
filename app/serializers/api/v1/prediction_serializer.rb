module Api
  module V1
    class PredictionSerializer < ActiveModel::Serializer
      embed :ids, include: true

      attributes :id,
                 :winner_id,
                 :loser_id,
                 :draw,
                 :correct,
                 :match_id,
                 :round_id,
                 :user_id,
                 :team_home,
                 :team_away

      def team_home
        object.team_home
      end

      def team_away
        object.team_away
      end
    end
  end
end

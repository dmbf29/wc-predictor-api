module Api
  module V1
    class MatchSerializer < ActiveModel::Serializer
      embed :ids, include: true

      attributes :id,
                 :kickoff_time,
                 :team_home_score,
                 :team_away_score,
                 :started,
                 :finished,
                 :team_home,
                 :team_away,
                 :group,
                 :round,
                 :prediction

      def prediction
        object.predictions.find_by(user_id: 1)
      end

      def kickoff_time
        object.kickoff_time.in_time_zone('Europe/Moscow').strftime("%d %b %R")
      end

      def team_home
        object.team_home
      end

      def team_away
        object.team_away
      end

      def round
        object.round
      end

      def group
        object.group
      end
    end
  end
end

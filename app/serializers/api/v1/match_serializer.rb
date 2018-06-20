module Api
  module V1
    class MatchSerializer < ActiveModel::Serializer
      attributes :id,
                 :kickoff_time,
                 :team_home_score,
                 :team_away_score,
                 :started,
                 :finished,
                 :team_home,
                 :team_away,
                 :winner_id,
                 :draw,
                 :group,
                 :round,
                 :prediction,
                 :team_home_names,
                 :team_away_names,
                 :draw_names,
                 :next_match

      def prediction
        return '' if scope.class == League
        prediction = object.predictions.find_by(user: scope)
        PredictionSerializer.new(prediction).attributes if prediction
      end

      def next_match
        object.next_match
      end

      def kickoff_time
        return '' if scope.class == League
        object.kickoff_time.in_time_zone(scope.timezone).strftime("%d %b %R")
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

      def team_home_names
        return '' if scope.class == User
        object.predictions.joins(:user).where(winner_id: object.team_home.id, draw: false, user_id: scope.users.pluck(:id)).map { |p| p.user.name }
      end

      def team_away_names
        return '' if scope.class == User
        object.predictions.joins(:user).where(winner_id: object.team_away.id, draw: false, user_id: scope.users.pluck(:id)).map { |p| p.user.name }
      end

      def draw_names
        return '' if scope.class == User
        object.predictions.joins(:user).where(draw: true, user_id: scope.users.pluck(:id)).map { |p| p.user.name }
      end
    end
  end
end

module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id,
                 :name,
                 :email,
                 :timezone,
                 :score,
                 :score_group,
                 :score_sixteen,
                 :score_quarters,
                 :score_semis,
                 :score_final,
                 :picks,
                 :knockout_picks,
                 :notify,
                 :position

      def picks
        object.predictions.count
      end

      def knockout_picks
        object.predictions.where.not(round: Round.first).count
      end

      # def champion
      #   final = object.predictions.find_by(round: Round.last)
      #   if final.nil?
      #     return 'N/A'
      #   else
      #     return final.winner.name
      #   end
      # end

      def position
        return '' unless serialization_options[:leaderboard]
        position = User.all.order(score: :desc).take(10).index(object)
        return (position + 1) if position
        (User.all.index(User.last) + 1)
      end
    end
  end
end

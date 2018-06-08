module Api
  module V1
    class GroupSerializer < ActiveModel::Serializer
      attributes :id,
                 :name,
                 :winner_id,
                 :runner_id,
                 :round_id

      has_many :matches, serializer: MatchSerializer

      def matches
        object.matches.order(kickoff_time: :asc)
      end
    end
  end
end

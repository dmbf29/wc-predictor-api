module Api
  module V1
    class PredictionSerializer < ActiveModel::Serializer
      embed :ids, include: true

      attributes :winner_id,
                 :loser_id,
                 :draw,
                 :correct,
                 :match_id,
                 :round_id,
                 :user_id
    end
  end
end

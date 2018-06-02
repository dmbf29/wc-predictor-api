module Api
  module V1
    class GroupSerializer < ActiveModel::Serializer
      attributes :id,
                 :name,
                 :winner_id,
                 :runner_id,
                 :round_id

      has_many :matches, serializer: Api::V1::MatchSerializer
    end
  end
end

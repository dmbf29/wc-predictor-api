module Api
  module V1
    class GroupSerializer < ActiveModel::Serializer
      embed :ids, include: true

      attributes :id,
                 :name

      has_one :winner, serializer: TeamSerializer, embed: :ids, include: false
      has_one :runner_up, serializer: TeamSerializer, embed: :ids, include: false
    end
  end
end

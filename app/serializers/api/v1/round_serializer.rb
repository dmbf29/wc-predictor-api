module Api
  module V1
    class RoundSerializer < ActiveModel::Serializer
      embed :ids, include: true

      attributes :id,
                 :name,
                 :number,
                 :current
    end
  end
end

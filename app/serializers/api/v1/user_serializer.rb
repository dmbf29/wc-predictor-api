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
                 :picks

      def picks
        object.predictions.count
      end
    end
  end
end

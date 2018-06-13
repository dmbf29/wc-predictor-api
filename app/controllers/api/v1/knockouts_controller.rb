module Api
  module V1
    class KnockoutsController < ApplicationController
      before_action :authenticate_user

      def index
        # Only Group Stage
        knockouts = Group.all.order(id: :desc).take(7).reverse
        render json: knockouts, each_serializer: GroupSerializer, scope: current_user
      end

      def names
        groups = Group.all.order(id: :asc)
        render json: groups
      end
    end
  end
end

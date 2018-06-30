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

      def show
        # Only Knockout round
        user_provided = User.find(params[:id])
        knockouts = Group.all.order(id: :desc).take(7).reverse
        render json: knockouts, each_serializer: GroupSerializer, scope: user_provided
      end
    end
  end
end

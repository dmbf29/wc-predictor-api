module Api
  module V1
    class GroupsController < ApplicationController
      before_action :authenticate_user

      def index
        # Only Group Stage
        groups = Group.all.order(id: :asc).take(8)
        render json: groups, each_serializer: GroupSerializer, scope: current_user
      end

      def names
        # Only Group Stage
        groups = Group.all.order(id: :asc).take(8)
        render json: groups
      end
    end
  end
end

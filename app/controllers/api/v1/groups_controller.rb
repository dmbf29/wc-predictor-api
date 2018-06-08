module Api
  module V1
    class GroupsController < ApplicationController
      before_action :authenticate_user

      def index
        groups = Group.all.order(id: :asc)
        render json: groups, each_serializer: GroupSerializer, scope: current_user
      end

      def names
        groups = Group.all.order(id: :asc)
        render json: groups
      end
    end
  end
end

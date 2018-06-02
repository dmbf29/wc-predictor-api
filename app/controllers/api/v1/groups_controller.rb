module Api::V1
  class GroupsController < ApplicationController
    before_action :authenticate_user

    def index
      groups = Group.all.order(id: :asc)
      render json: groups, each_serializer: Api::V1::GroupSerializer, scope: current_user
    end
  end
end

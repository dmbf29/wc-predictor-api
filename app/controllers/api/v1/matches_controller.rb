module Api::V1
  class MatchesController < ApplicationController
    before_action :authenticate_user

    def index
      matches = Match.all.order(:kickoff_time, group_id: :asc)
      render json: matches, each_serializer: Api::V1::MatchSerializer, scope: current_user
    end

    def show
      user_provided = User.find(params[:id])
      groups = Group.all.order(id: :asc)
      render json: groups, each_serializer: Api::V1::GroupSerializer, scope: user_provided
    end
  end
end

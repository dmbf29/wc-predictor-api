module Api::V1
  class MatchesController < ApplicationController
    before_action :authenticate_user

    def index
      matches = Match.all.order(:kickoff_time, group_id: :asc)
      render json: matches, each_serializer: Api::V1::MatchSerializer, scope: current_user
    end
  end
end

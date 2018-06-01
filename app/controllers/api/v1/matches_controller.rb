module Api::V1
  class MatchesController < ApplicationController
    before_action :authenticate_user

    def index
      matches = Match.all.order(kickoff_time: :asc).group_by(&:group_id)
      render json: matches, each_serializer: Api::V1::MatchSerializer, scope: current_user
    end
  end
end

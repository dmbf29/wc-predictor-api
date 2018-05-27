module Api::V1
  class MatchesController < ApplicationController
    def index
      matches = Match.all.order(kickoff_time: :asc)
      render json: matches, each_serializer: Api::V1::MatchSerializer
    end
  end
end

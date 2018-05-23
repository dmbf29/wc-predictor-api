module Api::V1
  class MatchesController < ApplicationController
    def index
      @matches = Match.all
      render json: @matches
    end
  end
end

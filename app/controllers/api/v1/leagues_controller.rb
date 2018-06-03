module Api::V1
  class LeaguesController < ApplicationController
    before_action :authenticate_user

    def index
      @leagues = current_user.leagues
      render json: @leagues, each_serializer: Api::V1::LeagueSerializer
    end

    def create
      @league = League.new(league_params)
      if @league.save
        Membership.create(user: current_user, league: @league)
      end
      render json: @league, serializer: Api::V1::LeagueSerializer
    end

    private

    def league_params
      params.require(:league).permit(:name, :password)
    end

    def membership_params
      params.require(:membership).permit(:user_token)
    end
  end
end

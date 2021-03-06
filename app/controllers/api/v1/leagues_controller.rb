module Api
  module V1
    class LeaguesController < ApplicationController
      before_action :authenticate_user

      def index
        @leagues = current_user.leagues
        render json: @leagues, each_serializer: LeagueSerializer
      end

      def create
        @league = League.new(league_params)
        if @league.save
          Membership.create(user: current_user, league: @league)
          render json: @league, serializer: LeagueSerializer
        else
          render status: '400', json: { status: 'League not created' }.to_json
        end
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
end

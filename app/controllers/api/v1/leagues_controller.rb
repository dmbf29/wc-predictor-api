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
        user = get_user(membership_params[:user_token])
        Membership.create(user: user, league: @league)
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

    def get_user(jwt)
      decoded_token = JWT.decode jwt, Rails.application.secrets.secret_key_base, true, { :algorithm => 'HS256' }
      User.find((decoded_token[0])['sub'])
    end
  end
end

module Api::V1
  class MembershipsController < ApplicationController
    before_action :authenticate_user

    def create
      @membership = Membership.new
      @membership.user = current_user
      @membership.league = League.find_by(key: league_params[:key], password: league_params[:password])
      render json: current_user.leagues, each_serializer: Api::V1::LeagueSerializer
    end

    private

    def league_params
      params.require(:league).permit(:key, :password)
    end
  end
end

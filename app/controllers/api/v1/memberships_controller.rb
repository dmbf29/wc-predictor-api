module Api::V1
  class MembershipsController < ApplicationController
    before_action :authenticate_user

    def create
      @membership = Membership.new
      @membership.user = current_user
      @membership.league = League.where('key = ? AND password ILIKE ?', league_params[:key], league_params[:password]).first
      @membership.save
      render json: current_user.leagues, each_serializer: Api::V1::LeagueSerializer
    end

    private

    def league_params
      params.require(:league).permit(:key, :password)
    end
  end
end

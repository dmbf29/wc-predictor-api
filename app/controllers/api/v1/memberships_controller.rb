module Api::V1
  class MembershipsController < ApplicationController
    before_action :authenticate_user

    def create
      @membership = Membership.new
      @membership.user = current_user
      @membership.league = League.where('key = ? AND password ILIKE ?', league_params[:key], league_params[:password]).first
      if @membership.save
        render json: @membership
      else
        render status: '400', json: { status: 'Membership not created' }.to_json
      end
    end

    private

    def league_params
      params.require(:league).permit(:key, :password)
    end
  end
end

module Api
  module V1
    class LeagueGroupsController < ApplicationController
      before_action :authenticate_user

      def index
        group = Group.find(params[:group_id])
        league = League.find(params[:id])
        render json: group.matches, each_serializer: MatchSerializer, scope: league
      end

      def show
        group = Group.find(params[:id])
        league = League.find(params[:league_id])
        render json: group.matches.order(kickoff_time: :asc), each_serializer: MatchSerializer, scope: league
      end
    end
  end
end


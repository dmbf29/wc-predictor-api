module Api::V1
  class TeamsController < ApplicationController
    def index
      @groups = Group.all
      render json: @groups
    end
  end
end

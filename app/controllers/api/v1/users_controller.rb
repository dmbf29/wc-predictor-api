module Api::V1
  class UsersController < ApplicationController
    before_action :authenticate_user, only: [:show, :update]

    def create
      @user = User.create(user_params)
      render json: @user
    end

    def show
      render json: current_user
    end

    def update
      @user = current_user
      @user.update(user_params)
      render json: @user
    end

    private

    def user_params
      params.require(:user).permit(:name,
                                   :email,
                                   :password,
                                   :password_confirmation,
                                   :notify,
                                   :timezone)
    end
  end
end

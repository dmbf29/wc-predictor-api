module Api::V1
  class UsersController < ApplicationController

    def create
      @user = User.create(user_params)
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

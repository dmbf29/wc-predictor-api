module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user, only: [:show, :update]

      def index
        @users = User.all.order(score: :desc).take(10)
        @users << current_user unless @users.include?(current_user)
        render json: @users, each_serializer: UserSerializer, leaderboard: true
      end

      def create
        @user = User.create(user_params)
        render json: @user
      end

      def show
        render json: current_user
      end

      def update
        @user = current_user
        if @user.update(user_params)
          render json: @user
        else
          render status: '400', json: { status: 'User not updated' }.to_json
        end
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
end

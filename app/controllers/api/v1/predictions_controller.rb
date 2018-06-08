module Api
  module V1
    class PredictionsController < ApplicationController
      before_action :authenticate_user

      def index
        predictions = Prediction.all
        render json: predictions, each_serializer: PredictionSerializer
      end

      def create
        @prediction = Prediction.new(prediction_params)
        @prediction.user = current_user
        @prediction.save
        render json: @prediction, serializer: PredictionSerializer
      end

      def update
        @prediction = Prediction.find(params[:id])
        @prediction.update(prediction_params)
        render json: @prediction, serializer: PredictionSerializer
      end

      private

      def prediction_params
        params.require(:prediction).permit(:winner_id,
                                           :loser_id,
                                           :draw,
                                           :match_id,
                                           :round_id,
                                           :correct,
                                           :user_id)
      end
    end
  end
end

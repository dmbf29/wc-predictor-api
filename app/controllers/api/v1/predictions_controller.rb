module Api
  module V1
    class PredictionsController < ApplicationController
      # before_action :authenticate_user

      def index
        predictions = Prediction.all
        render json: predictions, each_serializer: PredictionSerializer
      end

      def create
        @prediction = Prediction.new(prediction_params)
        @prediction.user = current_user
        if @prediction.save
          @prediction.configure_knockout
          render json: @prediction, serializer: PredictionSerializer
        else
          render status: '400', json: { status: 'Could not save' }.to_json
        end
      end

      def update
        @prediction = Prediction.find(params[:id])
        if @prediction.update(prediction_params)
          @prediction.configure_knockout
          render json: @prediction, serializer: PredictionSerializer
        else
          render status: '400', json: { status: 'Wrong user' }.to_json
        end
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

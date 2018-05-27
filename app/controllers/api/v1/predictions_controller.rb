module Api::V1
  class PredictionsController < ApplicationController
    # def index
    #   predictions = Prediction.all
    #   render json: predictions, each_serializer: Api::V1::PredictionSerializer
    # end

    def create
      @prediction = Prediction.create(prediction_params)
      render json: @prediction
    end

    private

    def prediction_params
      params.require(:prediction).permit(:winner_id,
                                         :loser_id,
                                         :draw,
                                         :round_id,
                                         :corret,
                                         :user_id)
    end
  end
end

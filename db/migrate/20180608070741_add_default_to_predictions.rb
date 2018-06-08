class AddDefaultToPredictions < ActiveRecord::Migration[5.1]
  def change
    change_column_default :predictions, :draw, false

    Prediction.where(draw: nil).each do |prediction|
      prediction.draw = false
      prediction.save
    end
  end
end

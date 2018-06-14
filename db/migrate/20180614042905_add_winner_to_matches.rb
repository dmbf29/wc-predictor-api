class AddWinnerToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :winner_id, :bigint
    add_column :matches, :draw, :boolean
  end
end

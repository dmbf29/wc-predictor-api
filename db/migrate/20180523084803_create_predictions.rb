class CreatePredictions < ActiveRecord::Migration[5.1]
  def change
    create_table :predictions do |t|
      t.integer :winner_id
      t.integer :loser_id
      t.boolean :draw
      t.boolean :correct
      t.references :match, foreign_key: true
      t.references :round, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

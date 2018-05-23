class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.string :kickoff_time
      t.integer :team_home_score
      t.integer :team_away_score
      t.boolean :finished, default: false
      t.boolean :started, default: false
      t.references :group, foreign_key: true
      t.integer :team_home_id
      t.integer :team_away_id
      t.references :round, foreign_key: true

      t.timestamps
    end
  end
end

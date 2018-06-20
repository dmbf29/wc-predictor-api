class AddTeamsToPredictions < ActiveRecord::Migration[5.1]
  def change
    add_column :predictions, :team_home_id, :bigint
    add_column :predictions, :team_away_id, :bigint
    add_column :matches, :next_match_id, :bigint
    add_column :matches, :next_match_home, :boolean
  end
end

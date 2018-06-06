class AddRankingToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :ranking, :integer
  end
end

class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :abbrev
      t.string :badge
      t.integer :points, default: 0
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end

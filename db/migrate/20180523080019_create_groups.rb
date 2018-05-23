class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :winner_id
      t.integer :runner_id
      t.references :round, foreign_key: true

      t.timestamps
    end
  end
end

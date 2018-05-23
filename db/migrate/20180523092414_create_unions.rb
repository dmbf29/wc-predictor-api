class CreateUnions < ActiveRecord::Migration[5.1]
  def change
    create_table :unions do |t|
      t.references :team, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end

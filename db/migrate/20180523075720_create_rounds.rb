class CreateRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :rounds do |t|
      t.integer :number
      t.string :name
      t.boolean :current, default: false

      t.timestamps
    end
  end
end

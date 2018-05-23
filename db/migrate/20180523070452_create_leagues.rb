class CreateLeagues < ActiveRecord::Migration[5.1]
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :password
      t.string :key

      t.timestamps
    end
  end
end

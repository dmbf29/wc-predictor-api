class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.boolean :admin, default: false
      t.integer :score, default: 0
      t.boolean :notify, default: false
      t.string :timezone, default: "Europe/Moscow"
      t.integer :score_group
      t.integer :score_sixteen
      t.integer :score_quarters
      t.integer :score_semis
      t.integer :score_final
      t.string :name

      t.timestamps
    end
  end
end

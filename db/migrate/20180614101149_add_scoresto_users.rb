class AddScorestoUsers < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :score_group, 0
    change_column_default :users, :score_sixteen, 0
    change_column_default :users, :score_quarters, 0
    change_column_default :users, :score_semis, 0
    change_column_default :users, :score_final, 0

    User.find_each do |user|
      user.score_group = 0
      user.score_sixteen = 0
      user.score_quarters = 0
      user.score_semis = 0
      user.score_final = 0
      user.save
    end
  end
end

class Prediction < ApplicationRecord
  belongs_to :match
  belongs_to :round
  belongs_to :user
  belongs_to :winner, class_name: 'Team', foreign_key: 'winner_id', optional: true
  belongs_to :loser, class_name: 'Team', foreign_key: 'loser_id', optional: true
  validates_uniqueness_of :user_id, scope: :match_id, on: :create
end

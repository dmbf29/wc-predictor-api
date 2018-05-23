class Group < ApplicationRecord
  has_many :matches
  has_many :unions
  has_many :teams, through: :unions
  belongs_to :round
  belongs_to :winner, class_name: 'Team', foreign_key: 'winner_id', optional: true
  belongs_to :runner_up, class_name: 'Team', foreign_key: 'runner_id', optional: true

  validates :name, presence: true
end

class Match < ApplicationRecord
  has_many :predictions
  belongs_to :group
  belongs_to :round
  belongs_to :winner, class_name: 'Team', foreign_key: 'winner_id', optional: true
  belongs_to :loser, class_name: 'Team', foreign_key: 'loser_id', optional: true
  belongs_to :team_home, class_name: 'Team', foreign_key: 'team_home_id'
  belongs_to :team_away, class_name: 'Team', foreign_key: 'team_away_id'
  belongs_to :next_match, class_name: 'Match', foreign_key: 'next_match_id', optional: true
end

class Prediction < ApplicationRecord
  belongs_to :match
  belongs_to :round
  belongs_to :user
  belongs_to :winner, class_name: 'Team', foreign_key: 'winner_id', optional: true
  belongs_to :loser, class_name: 'Team', foreign_key: 'loser_id', optional: true
  belongs_to :team_home, class_name: 'Team', foreign_key: 'team_home_id', optional: true
  belongs_to :team_away, class_name: 'Team', foreign_key: 'team_away_id', optional: true
  validates_uniqueness_of :user_id, scope: :match_id, on: :create
  validate :game_not_finished
  validate :real_team

  def game_not_finished
    if match.finished
      errors.add(:match_id, 'Match already finished')
    end
  end

  def real_team
    if winner && winner.ranking.nil?
      errors.add(:winner_id, 'This is not a real team')
    end
  end

  def configure_knockout
    return if round.number <= 1 || round.number == 5

    later_predictions = user.predictions.joins(:round).where('rounds.number > ?', round.number)
    if later_predictions.any?
      later_predictions.each do |prediction|
        prediction.team_home_id = nil if prediction.team_home_id == loser_id
        prediction.team_away_id = nil if prediction.team_away_id == loser_id
        prediction.winner_id = nil if prediction.winner_id == loser_id
        prediction.loser_id = nil if prediction.loser_id == loser_id
        prediction.save
      end
    end
    next_prediction = user.predictions.find_by(match: match.next_match)
    if next_prediction.nil?
      next_prediction = Prediction.new(match: match.next_match, round: match.next_match.round, user: user)
    end
    next_prediction.team_home_id = winner_id if match.next_match_home
    next_prediction.team_away_id = winner_id unless match.next_match_home
    next_prediction.save
  end
end

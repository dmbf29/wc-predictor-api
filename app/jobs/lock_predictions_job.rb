class LockPredictionsJob < ApplicationJob
  queue_as :default

  def perform(match_id)
    match = Match.find(match_id)
    match.started = true
    match.save
  end
end

class LockPredictionsJob < ApplicationJob
  queue_as :default

  def perform
    Match.where(started: false).each do |match|
      match.started = true
      match.save
    end
  end
end

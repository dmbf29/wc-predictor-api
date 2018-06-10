namespace :match do
  desc "Schedules kickoffs for matches"
  task lock_predictions: :environment do
    matches = Match.where.not(finished: true)
    matches.each do |match|
      LockPredictionsJob.set(wait_until: Time.parse(match.kickoff_time)).perform_later(match.id)
    end
  end
end

namespace :user do
  desc "Run World Cup site scraper for match results"
  task calculate_scores: :environment do
    matches = Match.where.not(finished: true).take(47)
    matches.each do |match|
      CalculateScoresJob.set(wait_until: Time.parse(match.kickoff_time) + 2.hours + 5.minutes).perform_later
      puts "Job checking for #{match.team_home.name} vs. #{match.team_away.name} @ #{match.kickoff_time}"
    end
  end
end

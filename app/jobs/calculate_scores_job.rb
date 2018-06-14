require 'open-uri'
require 'nokogiri'

class CalculateScoresJob < ApplicationJob
  queue_as :default

  def perform
    url = 'https://www.fifa.com/worldcup/matches/'

    puts 'Reading Fifa website...'
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    puts 'Looking at fixtures...'
    html_doc.search('.fi-mu.fixture').each do |element|

      puts 'Finding Team Names...'
      team_home_name = element.search('.fi-t.fi-i--4.home').search('.fi-t__nText').text.strip
      team_away_name = element.search('.fi-t.fi-i--4.away').search('.fi-t__nText').text.strip
      puts '*********'
      puts team_home_name
      puts team_away_name
      puts '*********'

      puts 'Finding Team Scores...'
      team_home_score = "" # TODO
      team_away_score = "" # TODO
      puts '*********'
      puts team_home_score
      puts team_away_score
      puts '*********'

      puts "Looking for team instances"
      team_home = Team.find_by(name: team_home_name)
      team_away = Team.find_by(name: team_away_name)
      puts '*********'
      puts team_home.name
      puts team_away.name
      puts '*********'

      next if team_home_score.blank? || team_away_score.blank?

      puts 'Looking for the match...'
      match = Match.where(
        team_home: team_home,
        team_away: team_away,
        finished: false
      ).first
      if match.nil?
        puts '*********'
        puts '** COULDNT FIND MATCH **'
        puts '*********'
      end
      next if match.nil?
      ActiveRecord::Base.transaction do
        if team_home_score > team_away_score
          match.finished = true
          match.draw = false
          match.winner_id = team_home.id
          match.team_home_score = team_home_score
          match.team_away_score = team_away_score
          if match.save
            puts '*********'
            puts "Match #{match.id} updated. Home Wins **"
            puts '*********'
            match.predictions.where(winner_id: team_home.id).each do |prediction|
              prediction.correct = true
              user = prediction.user
              user.score += 3
              user.score_group += 3
              prediction.save
              user.save
            end
            (match.predictions.where.not(winner_id: team_home.id) + match.predictions.where(draw: true)).each do |prediction|
              prediction.correct = false
              prediction.save
            end
          end
        elsif team_home_score < team_away_score
          match.finished = true
          match.draw = false
          match.winner_id = team_away.id
          match.team_home_score = team_home_score
          match.team_away_score = team_away_score
          if match.save
            puts '*********'
            puts "Match #{match.id} updated. Away Wins **"
            puts '*********'
            match.predictions.where(winner_id: team_away.id).each do |prediction|
              prediction.correct = true
              user = prediction.user
              user.score += 3
              user.score_group += 3
              prediction.save
              user.save
            end
            (match.predictions.where.not(winner_id: team_away.id) + match.predictions.where(draw: true)).each do |prediction|
              prediction.correct = false
              prediction.save
            end
          end
        elsif team_home_score == team_away_score
          match.finished = true
          match.draw = true
          match.team_home_score = team_home_score
          match.team_away_score = team_away_score
          if match.save
            puts '*********'
            puts "Match #{match.id} updated. Draw **"
            puts '*********'
            match.predictions.where(draw: true).each do |prediction|
              prediction.correct = true
              user = prediction.user
              user.score += 3
              user.score_group += 3
              prediction.save
              user.save
            end
            match.predictions.where.not(draw: true).each do |prediction|
              prediction.correct = false
              prediction.save
            end
          end
        end
      end
    end
  end
end

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
      time = element.search('.fi-mu__info').search('.fi-mu__info__datetime').text.strip.split('-')[0]
      kickoff_time = element.search('.fi-s__scoreText').text.strip
      venue = element.search('.fi__info__venue').text.strip
      time += kickoff_time
      group_name = element.search('.fi-mu__info').search('.fi__info__group').text.strip
      team_home_name = element.search('.fi-t.fi-i--4.home').search('.fi-t__nText').text.strip
      team_away_name = element.search('.fi-t.fi-i--4.away').search('.fi-t__nText').text.strip
      if venue == 'Kaliningrad'
        parsed_time = ActiveSupport::TimeZone['Europe/Kaliningrad'].parse(time).utc
      elsif venue == 'Moscow' || venue == 'Kazan' || venue == 'Nizhny Novgorod' || venue == 'Rostov-On-Don' || venue == 'Saransk' || venue == 'Sochi' || venue == 'St. Petersburg' || venue == 'Volgograd'
        parsed_time = ActiveSupport::TimeZone['Europe/Moscow'].parse(time).utc
      elsif venue == 'Samara'
        parsed_time = ActiveSupport::TimeZone['Europe/Samara'].parse(time).utc
      elsif venue == 'Ekaterinburg'
        parsed_time = ActiveSupport::TimeZone['Asia/Yekaterinburg'].parse(time).utc
      else
        raise
      end
      puts 'Groups..'
      group = Group.find_by(name: group_name)
      team_home = Team.find_by(name: team_home_name)
      team_away = Team.find_by(name: team_away_name)

      next if team_home.blank? || team_away.nil?

      puts 'Unions...'
      # Union.where(
      #   team: team_home,
      #   group: group
      # ).first_or_create

      puts 'Matches...'
      # match = Match.where(
      #   group: group,
      #   round: round_one,
      #   team_home_id: team_home.id,
      #   team_away_id: team_away.id
      # ).first_or_create
      # puts match.team_home.name + ' vs. ' + match.team_away.name
      # puts 'Old time: ' + match.kickoff_time
      # match.kickoff_time = parsed_time
      # puts 'New time: ' + match.kickoff_time
      # match.save
    end
  end
end

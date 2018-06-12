require 'open-uri'
require 'nokogiri'

namespace :match do
  desc 'Schedules kickoffs for matches'
  task lock_predictions: :environment do
    matches = Match.where.not(finished: true)
    matches.each do |match|
      LockPredictionsJob.set(wait_until: Time.parse(match.kickoff_time)).perform_later(match.id)
    end
  end

  desc 'Seeds knockout round games'
  task seed_knockout: :environment do

    Team.where(
      name: 'Group D Winner',
      abbrev: '1D'
    ).first_or_create

    team = Team.find_by(abbrev: "49..62")
    team.destroy unless team.nil?
    (49..62).to_a.each do |w|
      Team.where(
        name: ('Winner of ' + w.to_s),
        abbrev: ('W' + w.to_s)
      ).first_or_create
    end

    url = 'https://www.fifa.com/worldcup/matches/#knockoutphase'

    puts 'Reading Fifa website...'
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    knockout_phase = html_doc.search('div[data-tab="knockoutphase"]')

    puts 'Looking at fixtures...'
    counter = 0
    knockout_phase.search('.fi-mu.fixture').each do |element|
      counter += 1
      next if counter == 15
      time = element.search('.fi-mu__info').search('.fi-mu__info__datetime').text.strip.split('-')[0]
      kickoff_time = element.search('.fi-s__scoreText').text.strip
      venue = element.search('.fi__info__venue').text.strip
      time += kickoff_time
      team_home_name = element.search('.fi-t.home').search('.fi-t__nText').text.strip
      team_away_name = element.search('.fi-t.away').search('.fi-t__nText').text.strip
      team_home = Team.find_by(abbrev: team_home_name)
      team_away = Team.find_by(abbrev: team_away_name)

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

      puts "******************************"
      puts "counter: #{counter} / time: #{parsed_time} / home: #{team_home_name} away: #{team_away_name}"
      puts "**team home**"
      p team_home
      puts "**team away**"
      p team_away

      next if team_home.blank? || team_away.nil?

      if counter <= 8
        round = Round.find_by(number: 2, name: 'Round of Sixteen')
      elsif counter <= 12
        round = Round.find_by(number: 3, name: 'Quarterfinals')
      elsif counter <= 14
        round = Round.find_by(number: 4, name: 'Semifinals')
      elsif counter <= 16
        round = Round.find_by(number: 5, name: 'Final')
      end
      ActiveRecord::Base.transaction do
        if counter <= 4
          group = Group.where(name: 'Left Sixteen', round: round).first_or_create
        elsif counter <= 8
          group = Group.where(name: 'Right Sixteen', round: round).first_or_create
        elsif counter <= 10
          group = Group.where(name: 'Left Quarterfinals', round: round).first_or_create
        elsif counter <= 12
          group = Group.where(name: 'Right Quarterfinals', round: round).first_or_create
        elsif counter <= 13
          group = Group.where(name: 'Left Semifinals', round: round).first_or_create
        elsif counter <= 14
          group = Group.where(name: 'Right Semifinals', round: round).first_or_create
        elsif counter <= 16
          group = Group.where(name: 'Finals', round: round).first_or_create
        end


        puts 'Unions...'
        Union.where(
          team: team_home,
          group: group
        ).first_or_create
        Union.where(
          team: team_away,
          group: group
        ).first_or_create

        puts 'Matches...'
        match = Match.where(
          group: group,
          round: round,
          kickoff_time: parsed_time,
          team_home: team_home,
          team_away: team_away
        ).first_or_create

        puts '*****************************'
        puts '*****************************'
        puts match.team_home.name + ' vs. ' + match.team_away.name
        puts match.group.name + ' / ' + match.round.name
        puts '*****************************'
        puts '*****************************'
      end
    end
  end
end

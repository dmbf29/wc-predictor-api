class DecidersController < ApplicationController
  def england
    winner = Match.find_by(team_home: Team.find_by_name("Group H Winner"))
    england = Team.find_by_name('England')
    winner.team_home = england
    winner.save
    runner = Match.find_by(team_away: Team.find_by_name('Group H Runner-up'))
    belgium = Team.find_by_name('Belgium')
    runner.team_away = belgium
    runner.save
  end

  def belgium
    winner = Match.find_by(team_home: Team.find_by_name('Group H Winner'))
    belgium = Team.find_by_name('Belgium')
    winner.team_home = belgium
    winner.save
    runner = Match.find_by(team_away: Team.find_by_name('Group H Runner-up'))
    england = Team.find_by_name('England')
    runner.team_away = england
    runner.save
  end
end

require 'open-uri'
require 'nokogiri'

puts 'Teams'

ARG = Team.where(
        name: 'Argentina',
        abbrev: 'ARG'
      ).first_or_create
AUS = Team.where(
        name: 'Australia',
        abbrev: 'AUS'
      ).first_or_create
BEL = Team.where(
        name: 'Belgium',
        abbrev: 'BEL'
      ).first_or_create
BRA = Team.where(
        name: 'Brazil',
        abbrev: 'BRA'
      ).first_or_create
COL = Team.where(
        name: 'Colombia',
        abbrev: 'COL'
      ).first_or_create
CRC = Team.where(
        name: 'Costa Rica',
        abbrev: 'CRC'
      ).first_or_create
CRO = Team.where(
        name: 'Croatia',
        abbrev: 'CRO'
      ).first_or_create
DEN = Team.where(
        name: 'Denmark',
        abbrev: 'DEN'
      ).first_or_create
EGY = Team.where(
        name: 'Egypt',
        abbrev: 'EGY'
      ).first_or_create
ENG = Team.where(
        name: 'England',
        abbrev: 'ENG'
      ).first_or_create
ESP = Team.where(
        name: 'Spain',
        abbrev: 'ESP'
      ).first_or_create
FRA = Team.where(
        name: 'France',
        abbrev: 'FRA'
      ).first_or_create
GER = Team.where(
        name: 'Germany',
        abbrev: 'GER'
      ).first_or_create
IRN = Team.where(
        name: 'IR Iran',
        abbrev: 'IRN'
      ).first_or_create
ISL = Team.where(
        name: 'Iceland',
        abbrev: 'ISL'
      ).first_or_create
JPN = Team.where(
        name: 'Japan',
        abbrev: 'JPN'
      ).first_or_create
KOR = Team.where(
        name: 'Korea Republic',
        abbrev: 'KOR'
      ).first_or_create
KSA = Team.where(
        name: 'Saudi Arabia',
        abbrev: 'KSA'
      ).first_or_create
MAR = Team.where(
        name: 'Morocco',
        abbrev: 'MAR'
      ).first_or_create
MEX = Team.where(
        name: 'Mexico',
        abbrev: 'MEX'
      ).first_or_create
NGA = Team.where(
        name: 'Nigeria',
        abbrev: 'NGA'
      ).first_or_create
PAN = Team.where(
        name: 'Panama',
        abbrev: 'PAN'
      ).first_or_create
PER = Team.where(
        name: 'Peru',
        abbrev: 'PER'
      ).first_or_create
POL = Team.where(
        name: 'Poland',
        abbrev: 'POL'
      ).first_or_create
POR = Team.where(
        name: 'Portugal',
        abbrev: 'POR'
      ).first_or_create
RUS = Team.where(
        name: 'Russia',
        abbrev: 'RUS'
      ).first_or_create
SEN = Team.where(
        name: 'Senegal',
        abbrev: 'SEN'
      ).first_or_create
SRB = Team.where(
        name: 'Serbia',
        abbrev: 'SRB'
      ).first_or_create
SUI = Team.where(
        name: 'Switzerland',
        abbrev: 'SUI'
      ).first_or_create
SWE = Team.where(
        name: 'Sweden',
        abbrev: 'SWE'
      ).first_or_create
TUN = Team.where(
        name: 'Tunisia',
        abbrev: 'TUN'
      ).first_or_create
URU = Team.where(
        name: 'Uruguay',
        abbrev: 'URU'
      ).first_or_create

# teams.each do |team|
#   team = Team.where(
#     name: team[:name],
#     abbrev: team[:abbrev],
#     points: 0
#   ).first_or_create
#   # puts team.name
# end
puts 'End of Teams'

puts 'Rounds'
round_one = Round.where(
              number: 1,
              name: 'Group Stage',
              current: true
            ).first_or_create

round_two = Round.where(
              number: 2,
              name: 'Round of Sixteen'
            ).first_or_create

round_three = Round.where(
              number: 3,
              name: 'Quarterfinals'
            ).first_or_create

round_four = Round.where(
              number: 4,
              name: 'Semifinals'
            ).first_or_create

round_five = Round.where(
              number: 5,
              name: 'Final'
            ).first_or_create
puts 'End of Rounds'

puts 'Groups'
group_a = Group.where(
           name: 'Group A',
           round: round_one
          ).first_or_create

group_b = Group.where(
           name: 'Group B',
           round: round_one
          ).first_or_create

group_c = Group.where(
           name: 'Group C',
           round: round_one
          ).first_or_create

group_d = Group.where(
           name: 'Group D',
           round: round_one
          ).first_or_create

group_e = Group.where(
           name: 'Group E',
           round: round_one
          ).first_or_create

group_f = Group.where(
           name: 'Group F',
           round: round_one
          ).first_or_create

group_g = Group.where(
           name: 'Group G',
           round: round_one
          ).first_or_create

group_h = Group.where(
           name: 'Group H',
           round: round_one
          ).first_or_create

puts 'End of groups'

url = "https://www.fifa.com/worldcup/matches/"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.fi-mu.fixture').each do |element|
  time = element.search('.fi-mu__info').search('.fi-mu__info__datetime').text.strip.split("\r")[0]
  time = Time.parse(time).to_s
  group_name = element.search('.fi-mu__info').search('.fi__info__group').text.strip
  team_home = element.search('.fi-t.fi-i--4.home').search('.fi-t__nText').text.strip
  team_away = element.search('.fi-t.fi-i--4.away').search('.fi-t__nText').text.strip

  Match.where(
    kickoff_time: time,
    group: Group.find_by(name: group_name),
    team_home_id: Team.find_by(name: team_home).id,
    team_away_id: Team.find_by(name: team_away).id,
    round: round_one
  ).first_or_create
end




















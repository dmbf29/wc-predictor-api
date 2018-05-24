# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Teams'
teams = [
  {
    name: 'Argentina',
    abbrev: 'ARG'
  },
  {
    name: 'Australia',
    abbrev: 'AUS'
  },
  {
    name: 'Belgium',
    abbrev: 'BEL'
  },
  {
    name: 'Brazil',
    abbrev: 'BRA'
  },
  {
    name: 'Colombia',
    abbrev: 'COL'
  },
  {
    name: 'Costa Rica',
    abbrev: 'CRC'
  },
  {
    name: 'Croatia',
    abbrev: 'CRO'
  },
  {
    name: 'Denmark',
    abbrev: 'DEN'
  },
  {
    name: 'Egypt',
    abbrev: 'EGY'
  },
    {
    name: 'England',
    abbrev: 'ENG'
  },
  {
    name: 'Spain',
    abbrev: 'ESP'
  },
  {
    name: 'France',
    abbrev: 'FRA'
  },
  {
    name: 'Germany',
    abbrev: 'GER'
  },
  {
    name: 'Iran',
    abbrev: 'IRN'
  },
  {
    name: 'Iceland',
    abbrev: 'ISL'
  },
  {
    name: 'Japan',
    abbrev: 'JPN'
  },
  {
    name: 'Korea',
    abbrev: 'KOR'
  },
  {
    name: 'Saudi Arabia',
    abbrev: 'KSA'
  },
  {
    name: 'Morocco',
    abbrev: 'MAR'
  },
  {
    name: 'Mexico',
    abbrev: 'MEX'
  },
  {
    name: 'Nigeria',
    abbrev: 'NGA'
  },
  {
    name: 'Panama',
    abbrev: 'PAN'
  },
  {
    name: 'Peru',
    abbrev: 'PER'
  },
  {
    name: 'Poland',
    abbrev: 'POL'
  },
  {
    name: 'Portugal',
    abbrev: 'POR'
  },
  {
    name: 'Russia',
    abbrev: 'RUS'
  },
  {
    name: 'Senegal',
    abbrev: 'SEN'
  },
  {
    name: 'Serbia',
    abbrev: 'SRB'
  },
  {
    name: 'Switzerland',
    abbrev: 'SUI'
  },
  {
    name: 'Sweden',
    abbrev: 'SWE'
  },
  {
    name: 'Tunisia',
    abbrev: 'TUN'
  },
  {
    name: 'Uruguay',
    abbrev: 'URU'
  }
]

teams.each do |team|
  team = Team.where(
    name: team[:name],
    abbrev: team[:abbrev],
    points: 0
  ).first_or_create
  # puts team.name
end
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





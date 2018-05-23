# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
  Team.where(
    name: team[:name],
    abbrev: team[:abbrev],
    points: 0
  ).first_or_create
end

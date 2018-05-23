class Team < ApplicationRecord
  has_many :unions
  has_many :groups, through: :unions

  validates :name, presence: true
  validates :abbrev, presence: true
end

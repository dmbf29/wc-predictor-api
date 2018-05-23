class Team < ApplicationRecord
  belongs_to :group
  has_many :unions
  has_many :groups, through: :unions
end

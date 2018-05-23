class Round < ApplicationRecord
  has_many :matches
  has_many :groups
end

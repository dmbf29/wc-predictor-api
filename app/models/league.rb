class League < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships

  validates :name, presence: true, length: { minimum: 2, maximum: 30 }
  validates :password, presence: true
  after_create :generate_key

  def generate_key
    self.key = id + 100
    save
  end

  def matches
    Match.all
  end
end

class League < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships

  validates :name, presence: true
  validates :password, presence: true
  after_create :generate_key

  def generate_key
    self.key = id + 100
    save
  end
end

class User < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :leagues, through: :memberships
  has_many :predictions, dependent: :destroy
  validates :name, presence: true, length: { minimum: 2, maximum: 30 }
  validates :email, presence: true, uniqueness: true, length: { minimum: 2, maximum: 30 }
  validates :password, presence: true, length: { minimum: 2, maximum: 30 }
  validates :timezone, presence: true

  has_secure_password
end

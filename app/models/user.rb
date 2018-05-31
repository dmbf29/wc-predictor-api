class User < ApplicationRecord
  has_many :memberships
  has_many :leagues, through: :memberships

  has_secure_password
end

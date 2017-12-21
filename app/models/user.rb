class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas
  has_many :likes
  has_many :likes_added, through: :likes, source: :user

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, length: { in: 2..20 }
  validates :password, length: { in: 8..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :first_name, :last_name, :email, :password, :presence=> true
  
end
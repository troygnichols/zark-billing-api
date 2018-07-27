class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true
  validates :password, presence: true,
    length: {within: 6..100}, allow_nil: true
end

class User < ApplicationRecord
  has_secure_password

  attr_accessor :activation_token

  before_save   :downcase_email

  before_create :create_activation_digest

  has_many :invoices

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true,
    length: {within: 6..100}, allow_nil: true

  scope :active, ->{ where(active: true) }

  def activation_token_match?(token)
    return false if token.blank?
    BCrypt::Password.new(activation_digest).is_password?(token)
  end

  private

  def downcase_email
    self.email = email.downcase
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
end

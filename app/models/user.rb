class User < ApplicationRecord
  has_secure_password

  attr_accessor :activation_token, :reset_token

  before_save   :downcase_email

  before_create :create_activation_digest

  has_many :invoices

  validates :email, uniqueness: true, presence: true, format: {
    with: URI::MailTo::EMAIL_REGEXP
  }
  validates :password, presence: true,
    length: {within: 6..100}, allow_nil: true

  scope :active, ->{ where(active: true) }

  def activation_token_match?(token)
    return false if token.blank? || activation_digest.blank?
    BCrypt::Password.new(activation_digest).is_password?(token)
  end

  def password_reset_token_match?(token)
    return false if token.blank? || reset_digest.blank?
    BCrypt::Password.new(reset_digest).is_password?(token)
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update(
      reset_digest: User.digest(reset_token),
      reset_sent_at: Time.zone.now)
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
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

  def User.normalize_email(email)
    email.to_s.strip.downcase
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
end

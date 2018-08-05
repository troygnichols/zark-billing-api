# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/account_activation
  def account_activation
    user = User.new
    user.name = 'Test User'
    user.activation_token = User.new_token
    UserMailer.account_activation(
      user: user, activation_token: user.activation_token)
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    user = User.new
    user.reset_token = User.new_token
    UserMailer.password_reset(
      user: user, password_reset_token: user.reset_token)
  end

end

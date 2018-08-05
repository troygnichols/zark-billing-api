class UserMailer < ApplicationMailer
  helper :mailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user:, activation_token:)
    @user = user
    @activation_token = activation_token
    mail to: @user.email, subject: 'Account activation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user:, reset_token:)
    @password_reset_url = reset_password_url(
      token: reset_token, email: user.email)
    mail to: user.email, subject: 'Password reset'
  end
end

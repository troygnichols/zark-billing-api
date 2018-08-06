class PasswordController < ApplicationController
  before_action :set_user, only: [:update]

  skip_before_action :authenticate_request, only: [
    :send_reset, :reset, :forward_link]

  def update
    if params[:password].blank?
      errors = ActiveModel::Errors.new(@user)
      errors.add(:password, 'cannot be blank')
      render json: errors, status: :unprocessable_entity
    elsif @user.update(password_params)
      head :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def send_reset
    if params[:email].blank?
      render json: {email: ['cannot be empty']},
        status: :unprocessable_entity
      return
    end
    if user = User.find_by(email: User.normalize_email(params[:email]))
      user.create_reset_digest!
      UserMailer.password_reset(
        user: user, reset_token: user.reset_token).deliver_later
    else
      Rails.logger.info(
        "Password reset request for non-existing user: #{params[:email]}")
    end
    # For security, don't reveal whether the email matched
    # an existing user or not; always respond OK.
    head :ok
  end

  def forward_link
    user = User.find_by(email: User.normalize_email(params[:email]))
    if user && user.reset_digest.present? && !user.password_reset_expired?
      url = "#{zark_billing_base}/reset_password/edit?token=#{params[:token]}&email=#{params[:email]}"
      redirect_to url
    else
      redirect_to "#{zark_billing_base}/reset_password/expired"
    end
  end

  def reset
    if params[:password].blank?
      render json: {password: ['cannot be blank']},
        status: :unprocessable_entity
      return
    end

    user = User.find_by(email: User.normalize_email(params[:email]))
    unless user
      Rails.logger.info(
        "Password reset requested for non-existing user: #{params[:email]}")
      head :not_found
      return
    end

    unless user.password_reset_token_match?(params[:token])
      Rails.logger.info(
        "Password reset requested with bad token, user: #{user.email}")
      head :bad_request
      return
    end

    if user.password_reset_expired?
      Rails.logger.info "Password reset was expired, user: #{user.email}"
      head :bad_request
      return
    end

    if user.update_attributes(
        params.permit(:password, :password_confirmation).merge(
        reset_digest: nil))
      res = AuthenticateUser.response_content(user)
      render json: {auth_token: res[:token], profile: res[:profile]}
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = @current_user
  end

  def password_params
    params.permit(:password, :password_confirmation)
  end

  def zark_billing_base
    Rails.application.config.zark_billing[:base_url]
  end
end

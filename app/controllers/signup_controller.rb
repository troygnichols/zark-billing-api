class SignupController < ApplicationController
  skip_before_action :authenticate_request

  def create
    @user = User.new(signup_params)

    if @user.save
      UserMailer.account_activation(
        user: @user, activation_token: @user.activation_token
      ).deliver_later
      render template: 'profile/show', status: :created,
        location: profile_url(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def activate
    user = User.find_by(email: params[:email], active: false)
    if user && user.activation_token_match?(params[:token])
      user.update(active: true, activated_at: Time.zone.now)
      redirect_to login_url
    else
      render plain: 'User not found', status: :not_found
    end
  end

  private

  def signup_params
    params.require(:signup).permit(
      :email, :name, :address, :password, :password_confirmation)
  end

  def login_url
    case Rails.env
    when 'development'
      'http://localhost:3000/login'
    else
      'https://zark-billing.herokuapp.com/login'
    end
  end

end

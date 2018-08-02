class SignupController < ApplicationController
  skip_before_action :authenticate_request

  def create
    @user = User.new(signup_params)

    if @user.save
      render template: 'profile/show', status: :created,
        location: profile_url(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def activate
    redirect_to login_url
  end

  private

  def signup_params
    params.require(:signup).permit(
      :email, :name, :password, :password_confirmation)
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

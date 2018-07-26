class PasswordController < ApplicationController
  before_action :set_user, only: [:update]


  def update
    if @user.update(password_params)
      head :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = @current_user
  end

  def password_params
    params.permit(:password, :password_confirmation)
  end
end

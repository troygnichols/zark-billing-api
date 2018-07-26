class ProfileController < ApplicationController

  before_action :set_user, only: [:show, :update, :update_password]

  def show
  end

  def update
    if @user.update(profile_params)
      render :show, status: :ok, location: profile_url
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = @current_user
  end

  def profile_params
    params.require(:profile).permit(:email, :name, :address)
  end

end

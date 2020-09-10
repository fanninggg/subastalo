class Admin::UsersController < ApplicationController
  before_action :set_categories
  before_action :authenticate_user!

  def index
    @users = User.all.order(:created_at)
  end

  def show
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_back(fallback_location: admin_users_path)
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:approved)
  end
end

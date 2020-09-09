class Admin::UsersController < ApplicationController
  before_action :set_categories

  def index
    @users = User.all
  end

  def show
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit()
  end
end

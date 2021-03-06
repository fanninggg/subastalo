class Admin::UsersController < ApplicationController
  before_action :set_categories
  before_action :authenticate_user!

  def index
    @users = User.where(completed: true).order(:created_at)
    @strike = Strike.new
  end

  def show
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.approved
      UserMailer.with(user: @user).welcome.deliver_now
    end
    redirect_back(fallback_location: admin_users_path)
  end

  def destroy

  end

  def documents
    @user = User.find(params[:id])
    render partial: 'modal_content', locals: { documents: @user.documents }
  end

  private

  def user_params
    params.require(:user).permit(:approved, :rejection)
  end
end

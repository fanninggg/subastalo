class Admin::StrikesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @strike = Strike.new
  end

  def create
    @user = User.find(params[:user_id])
    @strike = Strike.new(strike_params)
    @strike.user = @user
    if @strike.save
      if @user.strikes.size == 3
        # Do whatever you want to users with three strikes here
      end
      redirect_to admin_users_path
    else
      render :new
    end
  end

  private

  def strike_params
    params.require(:strike).permit(:reason)
  end
end

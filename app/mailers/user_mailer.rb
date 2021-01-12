class UserMailer < ApplicationMailer
	def welcome
    @user = params[:user]
    mail(to: @user.email, subject: 'Bienvenido a Subastalo')
  end
end

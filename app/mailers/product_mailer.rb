class ProductMailer < ApplicationMailer
	def congratulations
    @bid = params[:bid]
    mail(to: @bid.user.email, subject:  "You won!")
  end

  def condolences
    @bid = params[:bid]
    mail(to: @bid.user.email,subject:  "You lost the auction")
  end
end

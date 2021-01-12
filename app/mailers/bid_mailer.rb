class BidMailer < ApplicationMailer
	def confirmation
    @bid = params[:bid]
    mail(to: @bid.user.email, subject:  "Bid confirmed")
  end

  def outbid
    @bid = params[:bid]
    @new_bid = params[:new_bid]
    mail(to: @bid.user.email,subject:  "You have been outbid")
  end
end

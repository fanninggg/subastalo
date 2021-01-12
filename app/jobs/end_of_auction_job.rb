class EndOfAuctionJob < ApplicationJob
  queue_as :default

  def perform(product)
  	bids_by_user = product.bids.reverse.uniq { |bid| bid.user_id } # first bid is winner, others are one bid per user
    bids_by_user[1..-1].each do |bid|
    	ProductMailer.with(bid: bid).condolences.deliver_now
    end
    ProductMailer.with(bid: product.bids.first).congratulations.deliver_now
  end
end

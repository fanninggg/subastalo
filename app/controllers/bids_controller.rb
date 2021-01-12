class BidsController < ApplicationController
  def create
    @bid = Bid.new(bid_params)
    @product = Product.find(params[:product])
    if @product.hidden?
      redirect_back(fallback_location: root_path)
      return
    end
    @bid.user = current_user
    @bid.product = @product
    previous_bid = @product.bids.last
    if @bid.save
      @product.update(highest_bid_cents: @bid.price_cents)
      confirmation_mail = BidMailer.with(bid: @bid).confirmation
      confirmation_mail.deliver_now
      if previous_bid 
        outbid_mail = BidMailer.with(bid: previous_bid, new_bid: @bid).outbid
        outbid_mail.deliver_now
      end
      redirect_to product_path(@product)
    else
      redirect_to product_path(@product), notice: @bid.errors.full_messages.join(',')
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:price)
  end
end

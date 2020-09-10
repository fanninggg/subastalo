class BidsController < ApplicationController
  def create
    @bid = Bid.new(bid_params)
    @product = Product.find(params[:product])
    @bid.user = current_user
    @bid.product = @product
    # Surely there is a way to do this via model validation but it's late at night and I'm drunk so you do it Wrighty
    if @bid.price > @bid.product.opening_price && @bid.price > @bid.product.bids.max_by(&:price).price && @bid.save
      redirect_to product_path(@product)
    else
      render "products/show"
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:price)
  end
end

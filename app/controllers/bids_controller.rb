class BidsController < ApplicationController
  def create
    @bid = Bid.new(bid_params)
    @product = Product.find(params[:product])
    @bid.user = current_user
    @bid.product = @product
    if @bid.save
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

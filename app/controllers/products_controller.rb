class ProductsController < ApplicationController
  before_action :set_product
  def show
    @bid = Bid.new
    @time_left = @product.end_time - Time.now
    @mm, @ss = @time_left.divmod(60)
    @hh, @mm = @mm.divmod(60)
    @dd, @hh = @hh.divmod(24)
    @winning_bid = @product.bids.last
    @users_offers = @product.bids.where(user: current_user)
  end

  def favorite
    current_user.favorite(@product)
    redirect_back fallback_location: favorites_path
  end

  def unfavorite
    current_user.unfavorite(@product)
    redirect_back fallback_location: favorites_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end

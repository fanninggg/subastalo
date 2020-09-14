class ProductsController < ApplicationController
  before_action :set_product
  def show
    @bid = Bid.new
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

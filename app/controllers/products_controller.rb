class ProductsController < ApplicationController
  before_action :set_product
  def show
  end

  def favorite
    current_user.favorite(@product)
  end

  def unfavorite
    current_user.unfavorite(@product)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end

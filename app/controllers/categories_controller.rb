class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products
    @min = @products.minimum(:opening_price_cents)
    @max = @products.maximum(:opening_price_cents)
    if params[:filter]
      bounds = params.dig(:filter, :price).split('-').map(&:to_i)
      @products = @products.where(opening_price_cents: bounds[0]..bounds[1])
      @start = bounds[0]
      @end = bounds[1]
    end
  end
end

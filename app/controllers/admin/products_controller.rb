class Admin::ProductsController < ApplicationController
  before_action :set_categories

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      raise
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :start_time, :end_time, :opening_price, :maximum_price, :category_id)
  end
end

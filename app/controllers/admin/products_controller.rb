class Admin::ProductsController < ApplicationController
  before_action :set_categories
  before_action :authenticate_user!

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

  def hide
    @product = Product.find(params[:id])
    @product.update(hidden: !@product.hidden?)
    redirect_to admin_category_path(@product.category)
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :start_time, :end_time, :opening_price, :maximum_price, :category_id)
  end
end

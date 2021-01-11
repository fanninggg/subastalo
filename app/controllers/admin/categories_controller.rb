class Admin::CategoriesController < ApplicationController
  before_action :set_categories
  before_action :authenticate_user!
  before_action :set_category, only: [:edit, :update, :destroy, :hide]

  def index
    @category = Category.new
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def show
    @category = Category.friendly.find(params[:id])
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end

  def hide
    @category.update(hidden: !@category.hidden?)
    redirect_to admin_category_path(@category)
  end

  private

  def category_params
    params.require(:category).permit(:name, :photo, :hidden, :terms, :description)
  end

  def set_category
    @category = Category.friendly.find(params[:id])
  end
end

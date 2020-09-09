class Admin::CategoriesController < ApplicationController
  before_action :set_categories

  def index
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update

  end

  def destroy

  end

  private

  def category_params
    params.require(:category).permit()
  end
end

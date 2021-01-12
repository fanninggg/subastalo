class Admin::ProductsController < ApplicationController
  before_action :set_categories
  before_action :authenticate_user!
  before_action :set_product, only: [:edit, :update, :destroy, :hide]

  def show
    @product = Product.friendly.find(params[:id])
    @bids = @product.bids.sort_by { |bid| bid.price_cents }.reverse!
    @time_left = @product.end_time - Time.now
    @mm, @ss = @time_left.divmod(60)
    @hh, @mm = @mm.divmod(60)
    @dd, @hh = @hh.divmod(24)
    @winning_bid = @product.bids.last
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      handle_features
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      handle_existing_features
      handle_features
      if @product.hidden
        redirect_to admin_category_path(@product.category)
      else
        redirect_to product_path(@product)
      end
    else
      render :edit
    end
  end

  def destroy
    @category = @product.category
    @product.delete
    redirect_to admin_category_path(@category)
  end

  def hide
    @product.update(hidden: !@product.hidden?)
    redirect_to admin_category_path(@product.category)
  end

  private

  def set_product
    @product = Product.friendly.find(params[:id])
  end

  def handle_existing_features
    features = params.dig(:product, :current_features)
    return unless features

    @product.features.each_with_index do |feature, i|
      feature.update(key: features[i][:key], value: features[i][:value])
    end
  end

  def handle_features
    features = params.dig(:product, :features)
    return unless features

    features.each { |feature| Feature.create(product: @product, key: feature[:key], value: feature[:value]) }
  end

  def product_params
    params.require(:product).permit(:name, :description, :start_time, :end_time, :opening_price, :maximum_price, :category_id, :hidden, :bid_increment, photos: [], documents: [])
  end
end

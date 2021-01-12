class PagesController < ApplicationController

  def home
    @categories = Category.where(hidden: false).first(6)
    # No idea how featured things are meant to be assigned 🤷‍♂️. For now it's the first 6
    @featured = Product.joins(:category).where(hidden: false, categories: { hidden: false }).last(6).reverse
  end

  def about
  end

  def terms
  end

  def privacy
  end

  def contact
    @contact = Contact.new
  end

  def favorites
    @favorites = current_user&.all_favorites&.map { |favorite| Product.find(favorite.favoritable_id)} || []
    @favorites.reject!(&:hidden?)
  end

  def history
    @bids = current_user&.bids&.map { |bid| Product.find(bid.product_id)} || []
    @products = @bids.uniq
    @bids.reject!(&:hidden?)
  end
end

class PagesController < ApplicationController

  def home
    @categories = Category.all
    # No idea how featured things are meant to be assigned 🤷‍♂️. For now it's the first 6
    @featured = Product.first(6)
  end

  def about
  end

  def contact
    @contact = Contact.new
  end

  def favorites
    @favorites = current_user&.all_favorites&.map { |favorite| Product.find(favorite.favoritable_id)} || []
    @favorites.reject!(&:hidden?)
  end
end

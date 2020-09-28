class PagesController < ApplicationController

  def home
    @categories = Category.all
    # No idea how featured things are meant to be assigned 🤷‍♂️. For now it's the first 6
    @featured = Product.where(category_id: 1).first(6)
  end

  def about
  end

  def profile
    @user = current_user
  end

  def contact
    @contact = Contact.new
  end

  def favorites
    @favorites = current_user&.all_favorites&.map { |favorite| Product.find(favorite.favoritable_id)} || []
  end
end

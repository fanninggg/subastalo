class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_categories
    @categories = Category.all
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :sex, :age])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address, :sex, :age, :photo, documents:[]])
  end

end

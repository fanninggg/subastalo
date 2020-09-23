class Admin::FeaturesController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @feature = Feature.find(params[:id])
    @feature.destroy
    redirect_to edit_admin_product_path(@feature.product)
  end
end

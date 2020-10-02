class DocumentsController < ApplicationController

  def destroy
    @document = ActiveStorage::Attachment.find(params[:id])
    return unless @document.record == current_user
    @document.purge
    redirect_back(fallback_location: request.referer)
  end
end

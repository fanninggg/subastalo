class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    @contact.email = current_user.email if current_user
    if @contact.save
      redirect_to root_path, notice: 'Message sent'
    else
      render 'pages/contact'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :message)
  end
end

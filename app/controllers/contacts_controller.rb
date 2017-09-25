class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    client = Client.find_by(id: params[:client_id])
    @contact = client.contacts.new(contact_params)

    if @contact.save
      flash[:success] = 'Contact created.'
      redirect_to "/users/#{client.user_id}/clients/#{client.id}"
    else
      flash[:error] = @contact.errors.full_messages.first
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :role, :email, :phone, :decision_maker)
  end
end

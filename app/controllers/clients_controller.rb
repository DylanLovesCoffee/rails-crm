class ClientsController < ApplicationController
  def index
    user = User.find_by(id: session[:user_id])
    @clients = user.clients
  end

  def new
    @client = Client.new
    render layout: false
  end

  def create
    user = User.find_by(id: session[:user_id])
    @client = user.clients.new(client_params)

    if @client.save
      flash[:success] = 'Customer profile created.'
      redirect_to "/users/#{user.id}/clients/#{@client.id}", status: 200
    else
      flash[:info] = @client.errors.full_messages.first
      render 'new'
    end
  end

  def show
    user = User.find_by(id: session[:user_id])
    @client = user.clients.find_by(id: params[:id])
  end

  def edit
    user = User.find_by(id: session[:user_id])
    @client = user.clients.find_by(id: params[:id])
  end

  def update
    user = User.find_by(id: session[:user_id])
    @client = user.clients.find_by(id: params[:id])

    if @client.update_attributes(client_params)
      flash[:success] = 'Customer profile updated.'
      redirect_to @client
    else
      flash[:danger] = 'Unable to update profile.'
      render 'edit'
    end
  end

  def destroy
    user = User.find_by(id: session[:user_id])

    if @client = user.clients.find_by(id: params[:id])
      @client.destroy
      redirect_to user.clients
    end
  end

  private

  def client_params
    params.require(:client).permit(:company_name, :value)
  end
end

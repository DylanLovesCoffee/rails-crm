class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Thanks for signing up, #{@user.first_name}!"
      redirect_to @user
    else
      @user.errors.full_messages.each do |error|
        flash[:error] = error
      end
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])
  end

  def edit
    @user = User.find_by(id: session[:user_id])
  end

  def update
    @user = User.find_by(id: session[:user_id])

    if @user.update_attributes(user_params)
      flash[:success] = 'Profile Updated'
      redirect_to @user
    else
      @errors = ['Unable to update profile.']
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :company, :email, :password, :password_confirmation)
  end
end

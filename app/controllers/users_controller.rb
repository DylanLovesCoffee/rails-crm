class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      @errors = @user.errors.full_messages
    end
  end

  def show

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :company, :email, :password_digest)
  end
end

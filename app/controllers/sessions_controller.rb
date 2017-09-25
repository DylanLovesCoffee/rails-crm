class SessionsController < ApplicationController
  def login
    @user = User.new
  end

  def authenticate
    if @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      @errors = ["Not a valid email or password."]
      render 'login'
    end
  end

  def logout
    session.clear
    redirect_to '/'
  end

  private

  def email_params
    params.require(:user).permit(:email)
  end

  def password_params
    params.require(:user).permit(:password)
  end

  def session_params
    params.permit(:email, :password)
  end

end

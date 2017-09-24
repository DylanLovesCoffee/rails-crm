class SessionsController < ApplicationController
  def login
    if @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
      session[:user_id] = @uesr.id
      redirect_to @user
    else
      @errors = ["Not a valid email or password."]
    end
  end

  def logout
    session.clear
  end

end

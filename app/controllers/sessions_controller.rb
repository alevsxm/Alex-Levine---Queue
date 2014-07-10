class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:current_user] = user.id
      redirect_to users_path
    else
      flash[:error] = "incorrect username or password"
      redirect_to login_path
    end

  end

  def destroy
    session[:current_user] = nil
    redirect_to login_path
  end

end

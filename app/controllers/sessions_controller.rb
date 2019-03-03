class SessionsController < ApplicationController
  skip_before_action :no_login
  def new
    if logged_in?
      redirect_to root_path
    end
  end

  def create
    # user = User.find_by_email(params[:email])
    user = User.where(email: params[:email] , active: true ).take
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:username] = user.username
      session[:email] = user.email
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end

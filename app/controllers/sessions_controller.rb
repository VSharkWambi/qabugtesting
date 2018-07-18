class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_login(params[:login])
    if user && user.authenticate(params[:password]) then
        session[:user_id] = user.id
        flash[:notice] = "Login successful!"
        redirect_back_or_default account_url
    else
        flash[:notice] = "bad credentials"
        redirect_to login_url
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logout successful!"
    redirect_to login_url
  end
end
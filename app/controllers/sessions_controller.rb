class SessionsController < ApplicationController
  def new
  end

  def create
    # login normally if not using oauth
    if auth_hash.nil?
      user = User.find_by_login(params[:login])
      if user && user.authenticate(params[:password]) then
          session[:user_id] = user.id
          flash[:notice] = "Login successful!"
          redirect_back_or_default account_url
      else
          flash[:notice] = "bad credentials"
          redirect_to login_url
      end
    # login with auth
    else
      user = User.find_or_create_from_auth_hash(auth_hash)
      session[:user_id] = user.id
      flash[:notice] = "Login successful!"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logout successful!"
    redirect_to login_url
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end

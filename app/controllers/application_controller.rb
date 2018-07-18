class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user_session, :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_usr

  def require_user
    unless current_user
      store_location
      flash[:notice] = 'You must be logged in to access this page'
      redirect_to login_url
      return false
    end
  end

  def require_no_user
    unless !current_user
      store_location
      flash[:notice] = 'You must not be logged in to access this page'
      redirect_to logout_url
      return false
    end
  end

  def store_location_with_message
    store_location
    unless current_user
      flash[:notice] = 'Log in to buy tix!'
    end
    return false
  end

  def store_location
    session[:return_to] = request.url
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end

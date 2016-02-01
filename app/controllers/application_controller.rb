class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  private

  def authorize
  	redirect_to login_url, alert: "Not Authorized" if current_user.nil?
  end

  def is_admin
    redirect_to root_path, alert: "Not authorized" if current_user.nil? or !current_user.admin?
  end
end

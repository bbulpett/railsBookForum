class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_filter :block_ip_addresses

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

  def block_ip_addresses
    head :unauthorized if current_ip_address == "184.154.139.9"
  end

  def current_ip_address
    request.env['HTTP_X_REAL_IP'] || request.env['REMOTE_ADDR']
  end
end

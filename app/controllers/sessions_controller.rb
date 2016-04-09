class SessionsController < ApplicationController
  def new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    user = User.find_by("username = ? OR email = ?", params[:login], params[:login])
    
    respond_to do |format|
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash.notice = "Logged in!"
        format.html { redirect_back(fallback_location: root_path) }
      else
        flash.alert = "Invalid Login!"
        format.html { redirect_back(fallback_location: root_path) }
        format.js
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

  private

  def session_params
    params.require(:session).permit(:login, :password)
  end
end
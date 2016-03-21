class SessionsController < ApplicationController
  def new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    user = User.find_by("username = ? OR email = ?", params[:login], params[:login])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :back, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
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
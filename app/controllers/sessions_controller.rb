class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:login])
    # user = User.where(["name = :value OR email = :value", { :value => params[:login].downcase }])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.notice = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
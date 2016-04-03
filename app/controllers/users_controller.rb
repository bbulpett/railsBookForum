class UsersController < ApplicationController
	def new
    @user = User.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @users = User.all
    @user = User.create(user_params)

    respond_to do |format|
      if verify_recaptcha && @user.save
        session[:user_id] = @user.id
        flash[:notice] = "Thank you for signing up!"
        format.html 
        format.js {render js: "window.location = '#{root_path}';"}
        format.json { render :show, status: :created, location: @user }
        
        if Rails.env.production?
          UserMailer.welcome_email(@user).deliver
        end
      else
        flash[:alert] = "Sign Up Failed!"
        format.html { redirect_back(fallback_location: root_path) }
        format.js
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:login, :email, :username, :password, :password_confirmation, :admin)
    end
end

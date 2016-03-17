class UsersController < ApplicationController
	def new
    @user = User.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if verify_recaptcha(model: @user, timeout: 30, message: "Problem with ReCAPTCHA, please try again.") && @user.save
        session[:user_id] = @user.id
        format.html { redirect_to root_path, notice: "Thank you for signing up!" }
        format.json { render :show, status: :created, location: @user }
        UserMailer.welcome_email(@user).deliver
      else
        format.html { render 'users/_new' }
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

class UsersController < ApplicationController
	def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if verify_recaptcha(model: @user, timeout: 60)
      @user.save!
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      puts "ReCAPTCHA is FALSE!!"
      render "new", alert: "ReCAPTCHA failed, please try again."
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

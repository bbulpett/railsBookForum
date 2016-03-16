class UserMailer < ApplicationMailer

	def welcome_email(user)
		@user = user
		@url = 'http://www.learningrails5.com'
		mail( to: @user.email, subject: 'test welcome email' )
		puts "***WELCOME EMAIL HAS BEEN SENT***"
	end
end

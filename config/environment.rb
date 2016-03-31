# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Necessary mail settings for using SendGrid with Heroku Cedar

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :enable_starttls_auto => true, # detects and uses STARTTLS
  :authentication => 'login',
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => 'rails-5-book.herokuapp.com',
  # :enable_starttls_auto => true
}
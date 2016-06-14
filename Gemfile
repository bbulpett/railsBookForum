source 'https://rubygems.org'

ruby '2.2.2'
gem 'rails', :git => 'git://github.com/rails/rails.git'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 2.7.2'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', github: "rails/coffee-rails"

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks and jQuery should cooperate
gem 'jquery-turbolinks'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Use Puma as the app server
gem 'puma'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Doorkeeper is an OAuth 2 provider for Rails and Grape
# gem 'doorkeeper', github: "doorkeeper-gem/doorkeeper"
# ReCAPTCHA plugin adds helpers for the reCAPTCHA API
gem "recaptcha", require: "recaptcha/rails", github: "ambethia/recaptcha"

# Kaminari gem does pagination and stuff
gem 'kaminari', '0.16.3'

# Make it pretty
gem 'bootstrap-sass', '~> 3.3.6'
gem 'sass-rails', '>= 3.2'
gem 'font-awesome-sass'
gem 'ckeditor', github: 'galetahub/ckeditor'
gem 'carrierwave'
gem 'mini_magick'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', github: 'rails/web-console'
  gem 'rspec-rails'
  gem 'capybara'
end

# SEO
gem 'meta-tags'
# Blacklisting
gem 'rack-attack'
# Support Cross-Origin Resource Sharing
gem 'rack-cors', :require => 'rack/cors'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

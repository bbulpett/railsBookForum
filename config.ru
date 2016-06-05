# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)

# Action Cable uses EventMachine which requires that all classes are loaded in advance
Rails.application.eager_load!

# The following line causes drama so I commented it
#require 'action_cable/process/logging'

run Rails.application

use Rack::Attack

use Rack::Cors do
  allow do
    origins 'localhost:3000', '127.0.0.1:3000',
    				'https://twitter.com/',
						'https://www.linkedin.com/',
						'https://plus.google.com/',
						'https://www.facebook.com/'
						
            # /\Ahttp:\/\/192\.168\.0\.\d{1,3}(:\d+)?\z/
            # regular expressions can be used here

    resource '/file/list_all/', :headers => 'x-domain-token'
    resource '/file/at/*',
        :methods => [:get, :post, :delete, :put, :patch, :options, :head],
        :headers => 'x-domain-token',
        :expose  => ['Some-Custom-Response-Header'],
        :max_age => 600
        # headers to expose
  end

  allow do
    origins '*'
    resource '/public/*', :headers => :any, :methods => :get
  end
end
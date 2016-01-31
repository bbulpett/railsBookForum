class User < ActiveRecord::Base
	has_secure_password

	has_many :topics
	has_many :posts

end

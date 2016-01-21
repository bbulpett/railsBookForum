class User < ApplicationRecord
	has_secure_password

	has_many :posts
	has_many :topics

	def to_s
		name\
	end

	def to_param
		to_s.parameterize
	end
end

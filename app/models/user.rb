class User < ApplicationRecord
	has_secure_password

	def to_s
		name\
	end

	def to_param
		to_s.parameterize
	end
end

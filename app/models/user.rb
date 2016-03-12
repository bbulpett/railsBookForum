class User < ApplicationRecord
	has_secure_password

	# has_many :topics
	has_many :posts

	validates :email, presence: true
	validates :password, format: {with: /(?=\A.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*\z/, message: "Passwords must be at least 8 characters in length and contain at least one upper case letter, one lower case letter, and one number or special character."}

end

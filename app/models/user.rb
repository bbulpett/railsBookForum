class User < ApplicationRecord
	has_secure_password

	# has_many :topics
	has_many :posts

	validates :email, presence: true, uniqueness: { case_sensitive: false, message: "already exists! Log in with this email or choose a different email address." }
	validates :password, format: {with: /(?=\A.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*\z/, message: "must be at least 8 characters in length and contain at least one upper case letter, one lower case letter, and one number or special character."}
	validates :username, presence: true, uniqueness: { case_sensitive: true, message: "is already taken. Please choose a different username." }
end

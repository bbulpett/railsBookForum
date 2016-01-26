class Forum < ApplicationRecord
	has_many :topics, dependent: :destroy
	has_many :posts, through: :topics

	def most_recent_post
	  topic = Topic.last
	  return topic
	end
end

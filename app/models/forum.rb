class Forum < ApplicationRecord
	has_many :topics, dependent: :destroy

	def most_recent_post
	  topic = Topic.last
	  return topic
	end
end

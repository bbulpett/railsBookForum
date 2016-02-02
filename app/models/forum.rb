class Forum < ApplicationRecord
	has_many :topics, dependent: :destroy
	has_many :posts, through: :topics

	accepts_nested_attributes_for :topics
	accepts_nested_attributes_for :posts

	def most_recent_post
	  topic = Topic.last
	  return topic
	end
end

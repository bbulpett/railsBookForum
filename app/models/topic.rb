class Topic < ApplicationRecord
	belongs_to :forum
	belongs_to :user
	
	has_many :posts, dependent: :destroy

	accepts_nested_attributes_for :posts
end

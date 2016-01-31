class Post < ApplicationRecord
  belongs_to :forum
  belongs_to :topic
  belongs_to :user

  validates :content, presence: true
end

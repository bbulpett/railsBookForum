class Post < ApplicationRecord
  belongs_to :topic, inverse_of: :posts
  belongs_to :user, inverse_of: :posts

  validates :content, presence: true

end

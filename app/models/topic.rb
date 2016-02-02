class Topic < ApplicationRecord
  belongs_to :forum
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :users, through: :posts

  accepts_nested_attributes_for :posts

  validates :title, presence: true
  # validates_associated :posts
end

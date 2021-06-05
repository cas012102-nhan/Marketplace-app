class Post < ApplicationRecord
  validates :title, :content, :published_at, presence: true
  belongs_to :user
  has_one_attached :image
end

class PostImage < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :comments
  has_many :favorites
  
  has_one_attached :image
  
  validates :image, presence: true
  validates :genre_id, presence: true
  
  def get_image(width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end
end

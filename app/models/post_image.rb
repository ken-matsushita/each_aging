class PostImage < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :comments
  has_many :favorites
  
  has_one_attached :image
  
  validates :image, presence: true
end

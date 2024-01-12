class PostImage < ApplicationRecord
  belongs_to :genre
  
  validates :image, presence: true
end

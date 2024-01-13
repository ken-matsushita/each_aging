class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post_images
  
  validates :body, presence: true
end

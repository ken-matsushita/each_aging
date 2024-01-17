class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post_image

  validates :body, presence: true, length: { maximum: 200 }
end

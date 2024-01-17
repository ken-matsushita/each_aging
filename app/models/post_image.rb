class PostImage < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :image

  validates :image, presence: true
  validates :genre_id, presence: true

  def get_image(width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end

  def self.search_for(content, method)
    if method == 'perfect'
      PostImage.where(name: content)
    elsif method == 'forward'
      PostImage.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      PostImage.where('name LIKE ?', '%' + content)
    else
      PostImage.where('name LIKE ?', '%' + content + '%')
    end
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  # いいねをつけた投稿の取得
  def self.liked_posts(user, page, per_page) # 1. モデル内での操作を開始
  includes(:favorites) # 2. favorites テーブルを結合
    .where(favorites: { user_id: user.id }) # 3. ユーザーがいいねしたレコードを絞り込み
    .order(created_at: :desc) # 4. 投稿を作成日時の降順でソート
    .page(page) # 5. ページネーションのため、指定ページに表示するデータを選択
    .per(per_page) # 6. ページごとのデータ数を指定
  end
  
end

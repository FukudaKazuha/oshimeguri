class Post < ApplicationRecord
  # アクティブストレージ
  has_one_attached :image
  # userとのアソシエーション
  belongs_to :user
  # post_commentとのアソシエーション
  has_many :post_comments, dependent: :destroy
<<<<<<< HEAD
  # いいねとのアソシエーション
  has_many :likes
  has_many :users, through: :likes
=======
  has_many :favorites, dependent: :destroy
>>>>>>> origin/feature/favorite
  
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  
   def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
   end
   
  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @post = Post.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @post = Post.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end
  
<<<<<<< HEAD
  def liked_by?(user)
   likes.where(user_id: user.id).exists?
=======
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
>>>>>>> origin/feature/favorite
  end
  
end



class Post < ApplicationRecord
  # アクティブストレージ
  has_one_attached :image
  # userとのアソシエーション
  belongs_to :user
  # postsとのアソシエーション
  has_many :post_comments, dependent: :destroy
  has_many :favorites
  has_many :users, through: :favorites 
  
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  # mapに必要なもの
  validates :address, presence: true
  
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
  
  def favorited_by?(user)
   favorites.exists?(user_id: user.id)
  end
  
# mapに必要なもの
  geocoded_by :address
  after_validation :geocode
  
end



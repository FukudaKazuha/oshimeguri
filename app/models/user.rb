class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # アクティブストレージ
  has_one_attached :profile_image
  # バリデーション
  validates :username, presence: true
  # プロフィール写真を設定しなくても大丈夫に
  after_initialize :set_default_profile_picture
  # postとのアソシエーション
  has_many :posts, dependent: :destroy
  # post_commentとのアソシエーション
  has_many :post_comments, dependent: :destroy
  # いいねとのアソシエーション
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post

# ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.username= "ゲスト"
      # バリデーションでusernameとしているからusernameが必要
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
  
  # プロフィール写真
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  

  private

  def set_default_profile_picture
    self.profile_image ||= 'default.jpg'
  end
  
  
  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("username LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("username LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("username LIKE?","%#{word}")
    elsif search == "partial_match"
      @user = User.where("username LIKE?","%#{word}%")
    else
      @user = User.all
    end
    
  end
end

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # アクティブストレージ
  has_one_attached :profile_image
  # バリデーション
  validates :username, presence: true
  # プロフィール写真を設定しなくても大丈夫に
  after_initialize :set_default_profile_picture

# ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@example.com', username: "ゲスト") do |user|
      # バリデーションでusernameとしているからusernameが必要
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

  private

  def set_default_profile_picture
    self.profile_image ||= 'default.jpg'
  end
end

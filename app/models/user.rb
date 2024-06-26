class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # アクティブストレージ
 has_one_attached :profile_image
         
  # バリデーション、emailとPW以外であればここに書くこと
  validates :username, presence: true
  
 
  def self.guest
    find_or_create_by!(email: 'guest@example.com', username: "ゲスト") do |user|
      # バリデーションでusernameとしているからusernameが必要
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end 
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # バリデーション、emailとPW以外であればここに書くこと
  validates :username, presence: true
  
  # 定数にメールアドレスを格納
  # GUEST_USER_EMAIL = "guest@example.com"

  # def self.guest
  #   # find_or_create_byでメールアドレスが存在するかどうか判断。存在しない場合はデータを作成する。
  #   find_or_create_by(email: GUEST_USER_EMAIL) do |user|
  #   　　　　# SecureRandom.urlsafe_base64:ランダムな文字列を生成するRubyのメソッド
  #     user.password = SecureRandom.urlsafe_base64
  #     user.name = "guestuser"
  #   end
  # end
  def self.guest
    find_or_create_by!(email: 'guest@example.com', username: "guest user") do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end 
  end
end

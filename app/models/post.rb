class Post < ApplicationRecord
  # アクティブストレージ
  has_one_attached :image
  
  validates :title, presence: true
  validates :body, presence: true
end

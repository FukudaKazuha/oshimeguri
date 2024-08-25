class PostComment < ApplicationRecord
  
 validates :comment, presence: true
  
  #アソシエーション 
 belongs_to :user
 belongs_to :post
end

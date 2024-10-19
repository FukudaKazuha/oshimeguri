class Favorite < ApplicationRecord
 belongs_to :user
 belongs_to :post
 # user_idとpost_image_idのペアが重複しない状態に制限
 validates :user_id, uniqueness: {scope: :post_id}
end

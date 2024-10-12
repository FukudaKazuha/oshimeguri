
Post.find_or_create_by!(title: "Cavello") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post.body = "の住所"
  post.address = "東京都千代田区丸の内1丁目" # 追記
  post.user = 福田
end

# Post.find_or_create_by!(title: "和食屋せん") do |post|
#   post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
#   post.body = "日本料理は美しい！"
#   post.address = "愛知県名古屋市中村区名駅１丁目１−４" # 追記
#   post.user = james
# end

# Post.find_or_create_by!(title: "ShoreditchBar") do |post|
#   post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")
#   post.caption = 'メキシコ料理好きな方にオススメ！'
#   post.address = "大阪府大阪市淀川区西中島5-16-1" # 追記
#   post.user = lucas
# end

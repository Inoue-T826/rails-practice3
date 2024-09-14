# メインのサンプルユーザーを1人作成する（既存ユーザーがいれば作成しない）
User.find_or_create_by!(email: "example@railstutorial.org", name: "Example User") do |user|
    user.password = "foobar"
    user.password_confirmation = "foobar"
    user.admin = true
    user.activated = true
    user.activated_at = Time.zone.now
end

# 追加のユーザーをまとめて生成する
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.find_or_create_by!(email: email) do |user|
    user.name = name
    user.password = password
    user.password_confirmation = password
    user.activated = true
    user.activated_at = Time.zone.now
  end
end

  # ユーザーの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(6)
users.each do |user|
 50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  user.microposts.find_or_create_by!(content: content)
 end
end

# ユーザーフォローのリレーションシップを作成する
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
# ユーザーが既にフォロー関係を持っていない場合のみ作成する
following.each do |followed|
  user.active_relationships.find_or_create_by!(followed_id: followed.id)
end
followers.each do |follower|
  follower.active_relationships.find_or_create_by!(followed_id: user.id)
end


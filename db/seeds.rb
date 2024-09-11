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

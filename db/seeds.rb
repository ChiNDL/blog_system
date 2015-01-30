User.create!(name:  "Linh Chi",
             email: "danlinhchi0393@gmail.com",
             password:              "123456",
             password_confirmation: "123456")

30.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

users = User.all
user = users.first
following = users[2..20]
followers = users[3..10]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

users = User.order(:created_at).take(6)
10.times do
title = Faker::Lorem.sentence
body = Faker::Lorem.paragraph(20)
comment = Faker::Lorem.sentence(5)
users.each do |u|
entry = u.entries.create!(title: title, body: body)
u.comments.create!(entry_id: entry.id, content: comment)
10.times do
u.followers.take(5).each do |follower|
follower.comments.create!(entry_id: entry.id,content: Faker::Lorem.sentence(5))
end
end
end
end
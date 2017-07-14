require 'faker'

User.create!({password: "password",
              username: "Reese"})

User.create!({password: "password",
              username: "Adam"})

User.create!({password: "password",
              username: "Doug"})

User.create!({password: "password",
              username: "Angelika"})

User.create!({password: "password",
              username: "Oscar"})

User.create!({password: "password",
             username: "Grandma"})
5.times do
	Comment.create({
    user_id: rand(1..5),
    post_id: rand(1..5),
    comment_body: Faker::Hipster.paragraph(2, false, 2)
  })
end

5.times do
	Post.create({
    user_id: rand(1..5),
		post_body: Faker::StarWars.quote
	})
end

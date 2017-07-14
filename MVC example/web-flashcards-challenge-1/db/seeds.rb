require_relative '../app/models/parser'

# Users seed data
janis = User.create( {:name => "Janis Joplin", :email => "theonejanis@sofly.com", :password => "flowers420"} )
jimmy = User.create( {:name => "Jimmy Hendrix", :email => "ihavegreathair@jimmy.com", :password => "powers420"} )


test_guess_one = Guess.create!({player_id: janis.id, card_id: 1, user_answer: true})
test_guess_two = Guess.create!({player_id: jimmy.id, card_id: 2, user_answer: false})


trek = Deck.create!({name: "Star Trek Trivia"})
potter = Deck.create!({name: "Harry Potter Trivia"})
ruby = Deck.create!({name: "Ruby Quiz"})

trek_deck = Parser.new("db/star_trek.txt")
trek_deck.parse
trek_cards = []
counter = 0
until counter == (trek_deck.questions.length - 1)
  trek_cards << Card.create!({deck_id: 1,
    question: trek_deck.questions[counter],
    answer: trek_deck.answers[counter]})
  counter += 1
end

potter_deck = Parser.new("db/potter.txt")
potter_deck.parse
potter_cards = []
counter = 0
until counter == (potter_deck.questions.length - 1)
  potter_cards << Card.create!({deck_id: 2,
    question: potter_deck.questions[counter],
    answer: potter_deck.answers[counter]})
  counter += 1
end

ruby_deck = Parser.new("db/cards.txt")
ruby_deck.parse
ruby_cards = []
counter = 0
until counter == (ruby_deck.questions.length - 1)
  ruby_cards << Card.create!({deck_id: 3,
    question: ruby_deck.questions[counter],
    answer: ruby_deck.answers[counter]})
  counter += 1
end

Round.create!(player_id: 1, deck_id: 1)
Round.create!(player_id: 2, deck_id: 3)

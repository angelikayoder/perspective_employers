# require_relative "../../app/models/user.rb"
# require_relative "../../app/models/card.rb"
# require_relative "../../app/models/deck.rb"
# require_relative "../../app/models/round.rb"
require_relative '../spec_helper'

# Rspec is not finding the database? Fail whale :(

#                         .:~~--__                __--~~:.
#                      ,:;'~'-,__~~--..,---..--~~__,-`~`::.
#                    ,:;'        ''-,_ (. .)_,-``        `::.
#                  ,;'                \ `\)/                `:.
#                 '                    `--'                    `
#
#        <^>       __  __
#    _____V_______ \  V  /
#   |              V    /
#  <| .____. <         /
#    \________________/
#
#

describe User do
  # before(:each) do
  #   @user = User.create!(name:"Lydia", :email => "Lydiamnash@gmail.com", :password => "dog" )
  # end
  let(:user1) { User.create(:name => "Lydia", :email => "Lydiamnash@gmail.com", :password => "dog") }

  let(:card1) { Card.create(:deck_id => 1, :question => "How many states are in the US?", :answer => "50")}

  let(:card2) { Card.create(:deck_id => 1, :question => "What is the capital of California?", :answer => "Sacramento")}

  let(:guess1_card1) { Guess.create(:player_id => 1, :card_id => 1, :user_answer => false) }

  let(:guess2_card1) { Guess.create(:player_id => 1, :card_id => 1, :user_answer => true) }

  let(:guess3_card2) { Guess.create(:player_id => 1, :card_id => 2, :user_answer => false) }

  let(:guess4_card2) { Guess.create(:player_id => 1, :card_id => 2, :user_answer => true) }

  let(:round1) { Round.create(:player_id => 1, :deck_id => 1)}

  let(:round2) { Round.create(:player_id => 1, :deck_id => 2)}



  describe 'initialization' do
    it 'creates a user with a hashed password' do
      expect(user1.password.class).to be_kind_of(BCrypt::Password)
    end
  end

  # describe 'associations' do
  #   it 'has many guesses' do
  #     # count the number of guesses - should be equal
  #     expect(user1.guesses).to eq(4)
  #   end

  #   it 'has many rounds' do
  #     # count the number of rounds - should be equal
  #     expect(user1.rounds).to eq(2)
  #   end

  #   it 'has many guessed cards' do
  #     # count the number of guessed cards - should be equal
  #     expect(user1.guessed_cards).to eq(4)
  #   end
  # end

end

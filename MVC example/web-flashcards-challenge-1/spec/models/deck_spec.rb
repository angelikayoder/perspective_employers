require 'spec_helper'

describe Deck do
  before(:all) do
    Card.delete_all
    Round.delete_all
    Deck.delete_all
  end

  let(:trek_deck) { Deck.create(name: "Star Trek Trivia") }


  it "#name" do
    expect(trek_deck.respond_to?(:name)).to be true
  end

  it "#created_at" do
    expect(trek_deck.respond_to?(:created_at)).to be true
  end

  it "#updated_at" do
    expect(trek_deck.respond_to?(:updated_at)).to be true
  end

  describe 'assocations' do
    it '#rounds' do
      (1..10).each do |i|
        Round.create(deck_id: trek_deck.id)
      end

      expect(trek_deck.rounds.length).to eq(10)
    end

    it '#cards' do
      (1..10).each do |i|
        card = Card.create!(
          deck_id: trek_deck.id,
          question: "question #{i}",
          answer: "answer #{i}"
        )
        # puts card.inspect
        # puts card.errors.inspects
      end

      expect(trek_deck.cards.length).to eq(10)
    end
  end

  # describe 'associations' do
  #   it 'has many rounds' do
  #     # count the number of guesses - should be equal
  #     expect(trek.guesses).to eq(4)
  #   end
  #
  #   it 'has many cards' do
  #     # count the number of rounds - should be equal
  #     expect(user1.rounds).to eq(2)
  #   end
end

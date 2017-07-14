class Round < ActiveRecord::Base
  belongs_to :player, class_name: 'User'
  belongs_to :deck
  has_many :cards, through: :deck
  has_many :guesses


  def right_on_first_try
    arr = []
    self.guesses.each do |guess|
      arr << guess.card_id
    end

    counts = Hash.new(0)
    arr.each{|val|counts[val]+=1}
    counts.reject{|val,count|count>1}.keys.count

    # refactor?
    # self.guesses.uniq{|x| x.card_id}.map!{|x| x.card_id}.count
  end
#if right on first try > 1 || card.user_answer == false, it means that for the particular card, they've guessed it more than once
#if right on first try == 1 they've got the answer on the first try

  # def get_rounds_cards
  #   @cards = self.deck.cards
  # end

  def available_cards(correct_card_ids)
    # Exclude cards that have already been successfully answered
    self.cards.reject do |card|
      puts "correct_card_ids = #{correct_card_ids}"
      correct_card_ids.include?(card.id)
    end
  end

  def get_next_card(correct_card_ids)
    available_cards(correct_card_ids).shuffle.first
    # @random_card = self.get_rounds_cards.sample
    #
    # self.get_rounds_cards.each do |card|
    #   if (@random_card.user_answer == nil) || (@random_card.user_answer == false)
    #     @random_card
    #   else
    #     false
    #   end
    # end
  end

  def number_of_guesses
    self.guesses.where(round_id: self.id).count
  end

  # def right_on_first_try
  #  # for each card get all the guesses that have this player_id & this round_id
  #  # count the guesses for each card
  #  # if greater than one, subtract one from the total
  #  #   number of cards
  # end

  def get_rounds_cards
   # get all the cards from this round's deck
    @cards = self.deck.cards
  end

end

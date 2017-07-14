class Card < ActiveRecord::Base
  # Remember to create a migration!
  validates :question, presence: true, uniqueness: true
  validates :answer, presence: true

  belongs_to :deck
  has_many :guesses

  def correct?(guess)
   self.answer == guess
 end

 # def

end

require 'bcrypt'

class User < ActiveRecord::Base

  # Associations
  has_many :rounds, :foreign_key => :player_id
  has_many :guesses, :foreign_key => :player_id
  has_many :guessed_cards, :through => :guesses, :source => :cards

  # Validation
  validates_presence_of :name, :email, :password_hash
  validates_uniqueness_of :email

  # Hashed password creation
  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
    self.password == password
  end

end

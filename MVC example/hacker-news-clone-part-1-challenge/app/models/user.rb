require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :comments
  has_many :posts

  before_create :hash_password

  validates_presence_of :username, :password
  validates_uniqueness_of :username

  def authenticate(pwd)
    BCrypt::Password.new(self.password) == pwd
  end

  private

  def hash_password
    self.password = BCrypt::Password.create(self.password)
  end

end

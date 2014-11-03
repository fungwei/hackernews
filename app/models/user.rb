class User < ActiveRecord::Base
  has_many  :posts
  has_many  :comments

  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true

  attr_accessor :error

  def self.valid?(username)
    User.exists?(username: username)
  end

  def authenticate(attempted_password)
    self.password == attempted_password
  end
end

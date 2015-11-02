class User < ActiveRecord::Base
	has_many :products
  has_many :favourites
	# This is Sinatra! Remember to create a migration!
	validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def self.authenticate(email, password)
    @user= User.find_by(:email => email)
    if @user && @user.password == password
      @user
    else
      nil
    end
  end
end

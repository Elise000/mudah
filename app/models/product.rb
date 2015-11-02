class Product < ActiveRecord::Base
	belongs_to :user
	has_many :favourites
	# This is Sinatra! Remember to create a migration!
end

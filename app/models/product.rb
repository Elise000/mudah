class Product < ActiveRecord::Base
	belongs_to :user
	has_many :favourites, dependent: :destroy
	# This is Sinatra! Remember to create a migration!
end

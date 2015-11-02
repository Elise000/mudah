class Favourite < ActiveRecord::Base
	belongs_to :product
	belongs_to :user
	# This is Sinatra! Remember to create a migration!
end

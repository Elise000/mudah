class CreateFavourites < ActiveRecord::Migration
	def change
		create_table :favourites do |t|
	      t.integer :add, :default => 0
	      t.integer :remove, :default => 0
	      t.timestamps null: false
	      t.integer :product_id
	      t.integer :user_id
		end
	end
end

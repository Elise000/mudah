class CreateProducts < ActiveRecord::Migration
	def change
		create_table :products do |t|
      t.string :description
      t.timestamps null: false
      t.integer :user_id
    end
	end
end

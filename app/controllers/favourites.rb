require 'byebug'

post "/products/:product_id/add_favourite" do
	if logged_in?
		@user = current_user
		@product = Product.find(params[:product_id])
		favourites = @product.favourites
		@favourite_exist = favourites.find_by(user_id: current_user.id)
		
		if @favourite_exist
			@favourite_exist.add = 1
			@favourite_exist.remove = 0
			@favourite_exist.save
		else
			@favourite = Favourite.create(add: 1, product_id: @product.id, user_id: current_user.id)
		end
			redirect to "/users/#{@user.id}/favourites"

	else
		redirect '/'
	end
end

get "/users/:user_id/favourites" do
	@user = User.find(params['user_id'])
	@favourites = Favourite.where(user_id: @user.id)
	erb :"users/user_favourites"

end

get "/users/:user_id/products/:product_id/favourites" do
	@user = User.find(params['user_id'])
	@product = Product.find(params[:product_id])
	@favourites = @product.favourites
	erb :"products/product_show"
end

delete "/favourites/:id" do
	@user = current_user
	@favourite = Favourite.find(params[:id])
	@favourite.destroy
	redirect "/users/#{@user.id}/favourites"
end


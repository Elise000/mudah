require 'byebug'


post "/products" do
	# byebug
	@user = current_user
	@product = @user.products.new(params[:product])
	@product.save
	redirect to "/home"
end

get "/home" do
	@user = current_user
	@products = Product.all
	erb :"static/home"
end

get "/users/:user_id/products" do
	@user = User.find(params['user_id'])
	@products = @user.products.all
  	erb :"products/products_index"
end


get "/users/:user_id/products/:id" do
	@user = User.find(params['user_id'])
	@product = Product.find(params[:id])
	erb :"products/product_show"
end

get "/products/:id/edit" do
	@user = current_user
	@product = Product.find(params[:id])
	erb :"products/products_edit"
end

put "/products/:id/edit" do
	@user = current_user
	@product = Product.find(params[:id])
	@product[:description] = params[:product][:description]
	@product[:price] = params[:product][:price]
	@product.save
	redirect "/users/#{@user.id}/products"
end

delete "/products/:id" do
	@user = current_user
	@product = Product.find(params[:id])
	@product.destroy
	redirect "/users/#{@user.id}/products"
end
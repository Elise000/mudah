require 'byebug'
enable :sessions

post '/signup' do
  @user = User.new(params[:user])

  if @user.save
    redirect '/'
  else
    @error_msg = "Bummer, Sign up failed"
    erb :"static/index"
  end
end

post '/login' do
  @user = User.authenticate(params[:user][:email], params[:user][:password])

  if @user
    session[:user_id] = @user.id
    # redirect "/products"
    erb :"products/products_index"
  else
    @error_msg = "Invalid User"
    erb :"static/index"
  end
end

get '/users/:id' do
  @user=User.find(params[:id])
  # @products = @user.products.all
  # @favourites = @user.favourites.all
  erb :"users/show"
end

get '/logout' do
  session[:user_id] = nil
  erb :"static/index"
end
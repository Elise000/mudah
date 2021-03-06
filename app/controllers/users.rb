require 'byebug'
enable :sessions

post '/signup' do
  @user = User.new(params[:user])

  if @user.save
    @message = "Successful Sign Up. Procees to Sign In below"
    redirect "/?msg=#{@message}"
    # redirect "/?msg=" + @message
  else
    @error_msg = "Bummer, Sign up failed"
    erb :"static/index"
  end
end

post '/login' do
  @user = User.authenticate(params[:user][:email], params[:user][:password])

  if @user
    session[:user_id] = @user.id
    redirect "/home"
  else
    @error_msg = "Invalid User"
    erb :"static/index"
  end
end

get '/users/:id' do
  @user = current_user
  # @products = @user.products
  # # @favourites = @user.favourites.all
  erb :"users/show"
end

get '/logout' do
  session[:user_id] = nil
  erb :"static/index"
end
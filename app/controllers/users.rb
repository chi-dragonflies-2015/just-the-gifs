get '/users/new' do
  @errors = ""
  @user = User.new
  @current_user = User.new
  erb :"/users/new"
end

post '/users' do
  data = {user_name: params[:user_name], password: params[:password], email: params[:email]}
  @user = User.new(data)

  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.messages
    erb :"/users/new"
  end
end

get '/users/:id' do |id|
  @user = User.find_by(id: id)
  @current_user = current_user
  erb :"/users/show"
end

get '/users' do
  @users = User.all
  erb :"/users/index"
end

get '/users/:id/edit' do |id|
  @user = User.find_by(id: id)
  redirect "/users/#{id}" unless authorized?(@user)
  erb :"users/edit"
end

put '/users/:id' do |id|
  @user = User.find_by(id: id)
  redirect "/users/#{id}" unless authorized?(@user)
  data = {user_name: params[:user_name], password: params[:password], email: params[:email]}
  if @user.update_attributes(data)
    redirect "/users/#{id}"
  else
    erb :"/users/edit"
  end
end

delete '/users/:id' do |id|
  @user = User.find_by(id: id)
  redirect "/auctions/#{id}" unless authorized?(@user)
  @user.destroy
  session.clear
  redirect '/users'
end

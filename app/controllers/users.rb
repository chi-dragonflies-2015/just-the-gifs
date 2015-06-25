get '/users/new' do
  @errors = ""
  erb :"/users/new"
end

post '/users' do
  @user = User.new(params)

  if @user.save
    session[:user_id] = @user.id
    redirect '/'
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
  redirect "/auctions/#{id}" unless authorized?(user)
  erb :"users/edit"

put '/users/:id' do |id|
  @user = User.find_by(id: id)
  redirect "/auctions/#{id}" unless authorized?(user)
  if @user.update_attributes(params)
    redirect "/users/#{id}"
  else
    erb :"/users/edit"
  end
end

delete '/users/:id' do |id|
  @user = User.find_by(id: id)
  redirect "/auctions/#{id}" unless authorized?(user)
  @user.destroy
  redirect '/users'
end

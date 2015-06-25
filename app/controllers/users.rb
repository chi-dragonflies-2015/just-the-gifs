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

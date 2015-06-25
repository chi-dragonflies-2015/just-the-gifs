get '/'
  erb :index
end

post '/login' do
  @user = User.authenticate(params[:user_name], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect back
  else
    erb :'index'
  end
end

delete '/logout' do
  session.clear
  redirect back
end

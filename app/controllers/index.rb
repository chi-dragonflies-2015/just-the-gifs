before '*' do
  @current_user = current_user if logged_in?
end

get '/' do
  erb :index
end

post '/login' do
  @user = User.authenticate(params[:user_name], params[:password])
  if @user
    @errors = ""
    session[:user_id] = @user.id
    redirect back
  else
    @errors = "invalid credentials"
    erb :'index'
  end
end

delete '/logout' do
  session.clear
  redirect back
end

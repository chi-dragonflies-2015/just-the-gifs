helpers do
  def logged_in?
    !session[:user_id].nil?
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def authorized?(user_id)
    user_id == current_user.id
  end
end

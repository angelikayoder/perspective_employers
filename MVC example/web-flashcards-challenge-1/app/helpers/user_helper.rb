helpers do

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    session[:user_id]
  end

  def redirect_login
    if !logged_in?
      redirect '/users/new'
    end
  end

end

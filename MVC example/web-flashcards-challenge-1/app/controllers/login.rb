get '/login' do
  erb :'login/index'
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect to '/decks'
  else
    redirect to '/login'
  end
end

get '/logout' do
  session.delete(:user_id)
  "You out"
end

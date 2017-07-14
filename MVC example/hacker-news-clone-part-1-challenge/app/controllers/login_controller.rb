get '/login' do
  erb :'/login/index'
end

post '/login' do
  user = User.find_by(username: params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/"
  else
    @errors = ["Incorrect Username and/or Password, try again"]
    erb :'/login/index'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect "/"
end

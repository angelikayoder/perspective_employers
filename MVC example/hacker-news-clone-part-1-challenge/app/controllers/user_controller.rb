
get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  puts params.inspect

  @user = User.new(
    username: params[:username],
    password: params[:password]
  )

  puts @user.inspect

  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = ["Try again!"]
    erb :'/users/new'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'/users/show'
end

post '/users/:id/delete' do
  @user = User.find(params[:id])
  @user.comments.destroy_all
  @user.posts.destroy_all
  @user.destroy
  session[:user_id] = nil
  redirect "/"
end

get '/users' do
  redirect to '/users/new'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    "Yes"
    redirect to '/decks'
  else
    "No"
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

# need the decks controller configured

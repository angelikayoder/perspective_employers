get '/decks' do
  @all_decks = Deck.all
  erb :'/decks/index'

end

get '/decks/:id' do
  @single_deck = Deck.find(params[:id])
  erb :'/decks/show'
end

post '/decks/:id' do
  @deck_id = params[:deck_id]
  redirect '/rounds'
end

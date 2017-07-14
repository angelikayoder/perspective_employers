# get '/cards' do
#   #display list of all cards
#   #/cards/index <- probably wouldn't want to see this
# end

get 'rounds/:round_id/cards/:id' do
  round = Round.find_by(id: params[:round_id])
  @current_card = Card.find_by(id: params[:id])
  erb :'cards/show'
end

post 'rounds/:round_id/cards/:id' do
  current_card = Card.find_by(id: params[:id])
  result = current_card.correct?(params[:guess])
  @current_guess = Guess.create!({
      player_id: session[:user_id],
      card_id: params[:id],
      round_id: params[:round_id],
      user_answer: result })
  redirect 
end

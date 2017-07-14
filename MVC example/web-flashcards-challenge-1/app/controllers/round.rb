post '/rounds' do
  round = Round.new({
    player_id: session[:user_id],
    deck_id: params[:deck_id]
  })

  if round.save
    redirect "/rounds/#{round.id}"
  end
end

get '/rounds/:id' do
  round = Round.find(params[:id])
  session[:correct_card_ids] = []
  redirect "rounds/#{round.id}/cards/#{round.get_next_card(session[:correct_card_ids]).id}"
end

get '/rounds/:round_id/cards/:card_id' do
  @round = Round.find(params[:round_id])
  @current_card = Card.find(params[:card_id])
  erb :'/cards/show'
end

post '/rounds/:round_id/cards/:card_id' do
  @round = Round.find(params[:round_id])
  @current_card = Card.find(params[:card_id])
  @is_correct = @current_card.correct?(params[:guess])

  if @is_correct
    session[:correct_card_ids] << @current_card.id
  end

  @current_guess = Guess.create!({
    player_id: session[:user_id],
    card_id: params[:card_id],
    round_id: params[:round_id],
    user_answer: @is_correct
  })

  @next_card = @round.get_next_card(session[:correct_card_ids])

  # if @next_card.nil?
  #   redirect '/rounds/#{@round.id}/finish'
  # else
  #   erb :'/cards/show'
  # end


  erb :'/cards/show'
end


get '/rounds/:round_id/finish' do
  @round = Round.find(params[:round_id])
  erb :'/rounds/show'
end



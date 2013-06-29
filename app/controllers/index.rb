get '/' do

  erb :index

end


get "/user/:id" do

  #find user by id.
  #pass as an instance var

#find user by id.
#pass as an instance var
  #find by id
  @user = User.find(params[:id])
  @decks = Deck.all
  erb :user_profile
end

get "/deck/:id" do
  puts "5" * 90
  p params
  @deck = Deck.find(params[:id])
  # @current_card = deck.shuffle

  erb :game
end

post "/play" do
  card_object = params[:card_id]
   @current_card = Card.find(card_object)
   current_guess = params[:user_input]
  if current_guess.downcase == @current_card.answer.downcase
    erb :_correct
  else
    erb :_wrong
post "/round/:current_card_id" do
  puts params
  current_guess = params[:user_input]
  current_card = Card.find(params[:current_card_id])

  if current_guess.downcase == current_card.answer.downcase
    erb :_success #render partial success
    redirect "deck/"
  else
    erb :_failure #render partial failure @current_card.answer
  end
  redirect "deck/#{@current_card.deck.id}"
end

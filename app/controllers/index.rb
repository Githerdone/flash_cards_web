get '/' do

  erb :index

end


get "/user/:id" do
  #find user by id.
  #pass as an instance var
  @user = User.find(params[:id])
  @decks = Deck.all
  erb :user_profile
end

get "/deck/:id" do
  puts "5" * 90
  p params
  deck = Deck.find(params[:id])
  @current_card = deck.shuffle.sample

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
  end
  redirect "deck/#{@current_card.deck.id}"
end


post '/profile' do
  if params[:user].length == 3
    @user = User.create(params[:user])
    redirect "/user/#{@user.id}"
  else
    @user = User.find_by_login(params[:user][:login])
    if @user
      login(params[:user]) 
    else
      redirect to('/')
    end
  end
end

get '/logout' do
  session.clear
  redirect to('/')
end

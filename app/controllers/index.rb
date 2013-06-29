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
  p params
  deck = Deck.find(params[:id])
  @current_card = deck.shuffle.sample

  erb :game
end

post "/play" do
  current_guess = params[:user_input]

  if current_guess.downcase == @current_card.answer.downcase
    #render partial success
  else
    #render partial failure @current_card.answer
  end


  redirect "deck/#{@deck.id}"
end


post '/profile' do
  if params[:user].length == 3
    @user = User.create(params[:user])
    erb :profile
  else
    @user = User.find_by_login(params[:user][:login])
    if @user
      login(params[:user]) 
    else
      redirect to('/')
    end
  end
end

get '/' do

#   login(params[:email])
  
# def login
#     @user = User.find_by_email(params[:email])
#     if @user.password == params[:password]
#       give_token
#     else
#       redirect_to home_url
#     end
#   end  erb :index
end


get "/:id" do
#find user by id.
#pass as an instance var
  @user = User.find(params[:id])
  @decks = Deck.all
  erb :user_profile
end

get "/decks/:id" do
   @deck = Deck.find(params[:id])
  erb :game
end

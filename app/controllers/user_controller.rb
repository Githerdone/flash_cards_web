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

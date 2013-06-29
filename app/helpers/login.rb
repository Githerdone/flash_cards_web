helpers do
  def login(params)
    if @user.password == params[:password]
      session[:user] = @user.id
      erb :profile
    else
      erb :index
    end
  end
end

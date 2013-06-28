class User < ActiveRecord::Base
  include BCrypt

  has_many :rounds
    # users.password_hash in the database is a :string
    # before_create :password

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def login(email, password)
    @user = User.find_by_login(email)
    if @user.password == password
      give_token
    else
      redirect_to '/'
    end
  end
end

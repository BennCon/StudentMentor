get "/index" do
  @user = User.new
  erb :index
end

post '/index' do
  @user = User.new
  @user.load(params)
  @error = nil

  if @user.exist?
    puts @user.get_type
    session[:logged_in] = true
    if @user.get_type == "admin"
       redirect "/my-account-admin"
    elsif @user.get_type == "mentor"
       redirect "/my-account-mentor"
    else
       redirect "/my-account-mentee"
    end
  else
    @error = "Username/Password combination incorrect"
#     redirect "/index"
  end

  erb :index
end

# get "/logout" do
#   session.clear
#   erb :logout
# end

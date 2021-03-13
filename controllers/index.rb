get "/index" do
  @user = User.new
  erb :index
end

post '/index' do
  @user = User.new
  @user.load(params)
  @error = nil

  if @user.exist?
    session[:logged_in] = true
    redirect "/my-account"
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

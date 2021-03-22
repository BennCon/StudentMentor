get "/" do
  session.clear
  @user = User.new
  erb :index
end

post '/' do
  @user = User.new
  @user.load(params)
  @error = nil

  #Checks if user is valid, sends them to the correct my-account page
  if @user.exist?
    puts @user.get_type
    session[:logged_in] = true
    if @user.get_type == "admin"
       email = params.fetch("email", "").strip
       @admin= Admin.where(Sequel.like(:email, "%#{email}%"))
       session[:id] = @admin.first.get_id
       redirect "/my-account-admin"
    elsif @user.get_type == "mentor"
       email = params.fetch("email", "").strip
       @mentor = Mentor.where(Sequel.like(:email, "%#{email}%"))
       session[:id] = @mentor.first.get_id
       redirect "/my-account-mentor"
    else
       email = params.fetch("email", "").strip
       @mentee = Mentee.where(Sequel.like(:email, "%#{email}%"))
       session[:id] = @mentee.first.get_id
       redirect "/my-account-mentee"
    end
  else
    @error = "Username/Password combination incorrect"
#     redirect "/"
  end

  erb :index
end

# get "/logout" do
#   session.clear
#   erb :logout
# end

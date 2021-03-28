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
       username = params.fetch("username", "").strip
       @admin= Admin.where(Sequel.like(:username, "%#{username}%"))
       session[:id] = @admin.first.get_id
       redirect "/my-account-admin"
    elsif @user.get_type == "mentor"
       username = params.fetch("username", "").strip
       @mentor = Mentor.where(Sequel.like(:username, "%#{username}%"))
       session[:id] = @mentor.first.get_id
       redirect "/my-account-mentor"
    else
       username = params.fetch("username", "").strip
       @mentee = Mentee.where(Sequel.like(:username, "%#{username}%"))
       session[:id] = @mentee.first.get_id
       redirect "/my-account-mentee"
    end
  else
    @error = "Username/Password combination incorrect"
  end

  erb :index
end


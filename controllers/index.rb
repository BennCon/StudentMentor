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
       email = params.fetch("email", "").strip
       @admin= Admin.where(Sequel.like(:email, "%#{email}%"))
       id = @admin.first.get_id
       redirect "/my-account-admin?id=#{id}"
    elsif @user.get_type == "mentor"
       email = params.fetch("email", "").strip
       @mentor = Mentor.where(Sequel.like(:email, "%#{email}%"))
       id = @mentor.first.get_id
       redirect "/my-account-mentor?id=#{id}"
    else
       email = params.fetch("email", "").strip
       @mentee = Mentee.where(Sequel.like(:email, "%#{email}%"))
       id = @mentee.first.get_id
       redirect "/my-account-mentee?id=#{id}"
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

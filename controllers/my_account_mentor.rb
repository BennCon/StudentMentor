get "/my-account-mentor" do
#   redirect "/" unless session[:logged_in]
  id = session[:id]
  @mentor = Mentor[id] if Mentor.id_exists?(id)
  erb :my_account_mentor
end

post "/my-account-mentor" do
    @first_name = params["first_name"]
    @surname = params["surname"]
    @email = params["email"]
    @industry = params["industry"]
    @biography = params["biography"]
    erb :my_account_mentor
end
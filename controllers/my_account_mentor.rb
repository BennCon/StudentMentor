get "/my-account-mentor" do
  id = params["id"]
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
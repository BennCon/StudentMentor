get "/my-account-mentor" do
  id = params["id"]
  @mentor = Mentor[id] if Mentor.id_exists?(id)
  erb :my_account_mentor
end

post "/my-account-mentor" do
    @name = params["name"]
    @email = params["email"]
    @industry = params["industry"]
    @biography = params["biography"]
    erb :my_account_mentor
end
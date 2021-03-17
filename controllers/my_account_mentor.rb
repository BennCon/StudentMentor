get "/my-account-mentor" do
  id = params["id"]
  @mentor = Mentor[id] if Mentor.id_exists?(id)
  erb :my_account_mentor
end

post "/my-account-mentor" do
    @name = params["name"]
    @email = params["email"]
    @Industry = params["Industry"]
    @biography = params["biography"]
    erb :my_account_mentor
end
get "/my-account-mentee" do
  id = params["id"]
  @mentee = Mentee[id] if Mentee.id_exists?(id)
  erb :my_account_mentee
end

post "/my-account-mentee" do
    @name = params["name"]
    @email = params["email"]
    @year_of_study = params["year_of_study"]
    @biography = params["biography"]
    erb :my_account_mentee
end
    
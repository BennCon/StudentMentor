get "/my-account-mentee" do
#   redirect "/" unless session[:logged_in]
  id = session[:id]
  @mentee = Mentee[id] if Mentee.id_exists?(id)
  erb :my_account_mentee
end

post "/my-account-mentee" do
    @first_name = params["first_name"]
    @surname = params["surname"]
    @email = params["email"]
    @year_of_study = params["year_of_study"]
    @biography = params["biography"]
    erb :my_account_mentee
end
    
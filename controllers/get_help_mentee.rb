get "/get-help-mentee" do
#   redirect "/index" unless session[:logged_in]
  id = params["id"]
  @mentee = Mentee[id] if Mentee.id_exists?(id)
  @user = User[id]
  erb :get_help_mentee
end
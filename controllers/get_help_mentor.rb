get "/get-help-mentor" do
#   redirect "/index" unless session[:logged_in]
  id = params["id"]
  @mentor = Mentor[id] if Mentor.id_exists?(id)
  @user = User[id]
  erb :get_help_mentor
end
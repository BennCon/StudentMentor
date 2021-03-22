get "/get-help-mentor" do
#   redirect "/index" unless session[:logged_in]
  id = session[:id]
  @mentor = Mentor[id] if Mentor.id_exists?(id)
  @user = User[id]
  erb :get_help_mentor
end
get "/get-help-mentor" do
  redirect "/index" unless session[:logged_in]
  id = session[:id]
  @mentee = Mentor[id] if Mentor.id_exists?(id)
  @user = User[id]
  
  @faqs = Questions_answers.all
  @admins = Admin.all
    
  erb :get_help_mentee
end
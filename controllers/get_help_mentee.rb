get "/get-help-mentee" do
  redirect "/index" unless session[:logged_in]
  id = session[:id]
  @mentee = Mentee[id] if Mentee.id_exists?(id)
  @user = User[id]
  
  @faqs = Questions_answers.all
  @admins = Admin.all
    
  erb :get_help_mentee
end
get "/my-account-mentor" do
#   redirect "/" unless session[:logged_in]
  id = session[:id]
  @mentor = Mentor[id] if Mentor.id_exists?(id)
  @user = User[id]
  erb :my_account_mentor
end

post "/my-account-mentor" do
    id = session[:id]
    @mentor = Mentor[id] if Mentor.id_exists?(id)
    @user = User[id]
   
    @mentor.load_edit(params)
    @user.load_edit(params)
   
    @mentor.save_changes
    @user.save_changes
    redirect "/my-account-mentor"
    erb :my_account_mentor
end
get "/my-account-mentee" do
  redirect "/" unless session[:logged_in]
  id = session[:id]
  @mentee = Mentee[id] if Mentee.id_exists?(id)
  @user = User[id]
  erb :my_account_mentee
end

post "/my-account-mentee" do
   id = session[:id]
   @mentee = Mentee[id] if Mentee.id_exists?(id)
   @user = User[id]
   
   #Lets users edit details
   @mentee.load_edit(params)
   @user.load_edit(params)

   @mentee.save_changes
   @user.save_changes
   redirect "/my-account-mentee"
   erb :my_account_mentee
end
    
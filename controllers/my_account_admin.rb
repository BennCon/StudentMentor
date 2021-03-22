get "/my-account-admin" do
  redirect "/" unless session[:logged_in]
  id = session[:id]
  @admin = Admin[id] if Admin.id_exists?(id)
  @user = User[id]
  erb :my_account_admin
end

post "/my-account-admin" do
   id = session[:id]
   @admin = Admin[id] if Admin.id_exists?(id)
   @user = User[id]

   #Lets users edit details
   @admin.load_edit(params)
   @user.load_edit(params)

   @admin.save_changes
   @user.save_changes
   redirect "/my-account-admin"
   erb :my_account_admin
end


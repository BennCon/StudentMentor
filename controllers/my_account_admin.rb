get "/my-account-admin" do
#   redirect "/index" unless session[:logged_in]
  id = params["id"]
  @admin = Admin[id] if Admin.id_exists?(id)
  erb :my_account_admin
end
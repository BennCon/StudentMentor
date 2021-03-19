get "/get-help" do
#   redirect "/index" unless session[:logged_in]
  id = params["id"]
  @mentee = Mentee[id] if Mentee.id_exists?(id)
  erb :get_help
end
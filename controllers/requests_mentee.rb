get "/requests-mentee" do
  redirect "/index" unless session[:logged_in]
  id = session[:id]
  @mentee = Mentee[id] if Mentee.id_exists?(id)
  @user = User[id]
  erb :requests_mentee
end
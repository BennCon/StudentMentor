get "/all-mentees" do
  redirect "/" unless session[:logged_in]
  id = session[:id]
  @mentees = Mentee.all
  erb :all_mentees
end
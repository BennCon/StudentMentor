get "/all-mentors" do
  redirect "/" unless session[:logged_in]
  id = session[:id]
  @mentors = Mentor.all
  erb :all_mentors
end
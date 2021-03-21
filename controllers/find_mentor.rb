get "/find-mentor" do
#   redirect "/index" unless session[:logged_in]
   @dataset = DB[:mentors]
   @num_rows = @dataset.count


   
  erb :find_mentor
end
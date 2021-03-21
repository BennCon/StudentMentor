get "/find-mentor" do
#   redirect "/index" unless session[:logged_in]
   id = session[:id]
   @mentee = Mentee[id] if Mentee.id_exists?(id)
   @user = User[id]
   @dataset = DB[:mentors]
   @num_rows = @dataset.count


   
  erb :find_mentor
end
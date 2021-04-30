get "/requests-mentor" do
  redirect "/index" unless session[:logged_in]
  id = session[:id]
  @mentor = Mentor[id] if Mentor.id_exists?(id)
  @user = User[id]
   
  @requests = DB[:requests].where(mentor_id: id)
  @mentees = DB[:mentees].where(id: ) 
   
  mentee_req_ids = []
  @requests.each do |request|
     mentee_req_ids << request[:mentee_id]
  end
   
   
  puts mentee_req_ids

     
  erb :requests_mentor
end
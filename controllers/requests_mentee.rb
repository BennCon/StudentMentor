get "/requests-mentee" do
  redirect "/index" unless session[:logged_in]
  id = session[:id]
  @mentee = Mentee[id] if Mentee.id_exists?(id)
  @user = User[id]
   
  @requests = DB[:requests].where(mentee_id: id)
  @mentors = DB[:mentors] 
   
  @mentor_req_ids = []
  @mentor_accepted_ids = []
  @requests.each do |request|
     if request[:accepted] == 0
        @mentor_req_ids << request[:mentor_id]
     elsif request[:accepted] == 1
        @mentor_accepted_ids << request[:mentor_id]
     end
  end
    
  erb :requests_mentee
end

post "/deleteMethod" do
   id = session[:id]
   mentee = Mentee[id]
   mentee[:has_mentor] = 0
   mentee[:mentor_id] = 0
   mentee.save_changes(:validate => false)
   
   
   mentor = Hash.new
   mentor["mentorId"] = params.fetch("mentorId", "").strip
   mentor_id = mentor["mentorId"].to_i
   mentor = Mentor[mentor_id]
   mentor[:number_of_mentees] -= 1
   mentor.save_changes(:validate => false) 
   
   @requests = DB[:requests].where(mentee_id: id)
   @requests.each do |request|
      if request[:mentor_id] == mentor_id
         request = Request[request[:id]]
         request.delete
      end
   end
   
   redirect "/requests-mentee"
end
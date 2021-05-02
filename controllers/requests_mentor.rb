get "/requests-mentor" do
  redirect "/index" unless session[:logged_in]
  id = session[:id]
  @mentor = Mentor[id] if Mentor.id_exists?(id)
  @user = User[id]
   
  @requests = DB[:requests].where(mentor_id: id)
  @mentees = DB[:mentees] 
   
  @mentee_req_ids = []
  @mentee_accepted_ids = []
  @requests.each do |request|
     if request[:accepted] == 0
        @mentee_req_ids << request[:mentee_id]
     elsif request[:accepted] == 1
        @mentee_accepted_ids << request[:mentee_id]
     end
  end
   
   
      
  erb :requests_mentor
end

post "/acceptMethod" do
   id = session[:id]
   mentee = Hash.new
   mentee["menteeId"] = params.fetch("menteeId", "").strip
   mentee_id = mentee["menteeId"].to_i
   
   @requests = DB[:requests].where(mentor_id: id)
   @requests.each do |request|

      if mentee_id == request[:mentee_id]
         request = Request[request[:id]]
         request[:accepted] = 1
         request.save_changes
      end
   end
   
   redirect "/requests-mentor"
end
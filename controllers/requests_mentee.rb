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
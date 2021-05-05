get "/find-mentor" do
   redirect "/index" unless session[:logged_in]
   id = session[:id]
   @mentee = Mentee[id] if Mentee.id_exists?(id)
   @user = User[id]

   #For filtering mentors
   filters = Hash.new
   filters["gender"] = params.fetch("gender", "").strip
   filters["industry"] = params.fetch("industry", "").strip
   filters["degree_field"] = params.fetch("degree_field", "").strip
   filters["sheffield_graduate"] = params.fetch("sheffield_graduate", "").strip
    
   @mentors = DB[:mentors]
   
   @requests = DB[:requests].where(mentee_id: id)
   @already_req = []
   @requests.each do |request|
      @already_req << request[:mentor_id]
   end
   
   filters.each do |filter, value|
      @mentors = @mentors.where(Sequel.like(:"#{filter}", "#{value}%"))
   end
   

   
  erb :find_mentor
end

post "/runMethod" do
   requests_db = DB[:requests]
   id = session[:id]
  
   mentor = Hash.new
   mentor["mentorId"] = params.fetch("mentorId", "").strip
   mentor_id = mentor["mentorId"]

   
   request = Request.new
   request.mentee_id = id
   request.mentor_id = mentor_id
   request.accepted = 0
   request.save_changes

     
   redirect "/find-mentor"
end
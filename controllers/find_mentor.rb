get "/find-mentor" do
   redirect "/index" unless session[:logged_in]
   id = session[:id]
   @mentee = Mentee[id] if Mentee.id_exists?(id)
   @user = User[id]
   @mentors = DB[:mentors]
   @requests = DB[:requests].where(mentee_id: id)
   
   #For filtering mentors
   filters = Hash.new
   filters["gender"] = params.fetch("gender", "").strip
   filters["industry"] = params.fetch("industry", "").strip
   filters["degree_field"] = params.fetch("degree_field", "").strip
   filters["sheffield_graduate"] = params.fetch("sheffield_graduate", "").strip
   
   filters.each do |filter, value|
      @mentors = @mentors.where(Sequel.like(:"#{filter}", "#{value}%"))
   end
    
   #List of mentors that user's requested, so they can't request again
   @already_req = []
   @requests.each do |request|
      @already_req << request[:mentor_id]
   end
  
  erb :find_mentor
end

post "/requestMethod" do
   requests_db = DB[:requests]
   id = session[:id]
  
   #Gets details of requested mentor
   mentor = Hash.new
   mentor["mentorId"] = params.fetch("mentorId", "").strip
   mentor_id = mentor["mentorId"]
   
   #Updates mentee's database
   mentee = Mentee[id]
   mentee[:has_contacted] += 1
   mentee.save_changes(:validate => false)
   
   #Makes a request in the request table
   request = Request.new
   request.mentee_id = id
   request.mentor_id = mentor_id
   request.accepted = 0
   request.save_changes
    
   require "net/http"

   #Sends notification email to mentor
   def send_mail(email, subject, body)
      response = Net::HTTP.post_form(URI("http://www.dcs.shef.ac.uk/cgi-intranet/public/FormMail.php"),
                                     "recipients" => email,
                                     "subject" => subject,
                                     "body" => body)
      response.is_a? Net::HTTPSuccess
   end

    mentor["mentorEmail"] = params.fetch("mentorId", "").strip
    email = mentor["mentorEmail"]

    subject = "New request"

    body = "You have a new mentee request. Go check it on the website."

   
    send_mail(email, subject, body)
    
   redirect "/success-request"
end
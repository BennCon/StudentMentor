get "/requests-mentor" do
  redirect "/index" unless session[:logged_in]
  id = session[:id]
  @mentor = Mentor[id] if Mentor.id_exists?(id)
  @user = User[id]
  @requests = DB[:requests].where(mentor_id: id)
  @mentees = DB[:mentees] 
   
  #Gets details of requests, separting into pending and accepted
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
   #Updates mentee's DB details
   id = session[:id]
   mentee = Hash.new
   mentee["menteeId"] = params.fetch("menteeId", "").strip
   mentee_id = mentee["menteeId"].to_i
   mentee = Mentee[mentee_id]
   mentee[:has_mentor] = 1
   mentee[:mentor_id] = id
   mentee.save_changes(:validate => false)
   
   #Updates mentor's DB details
   mentor = Mentor[id]
   mentor[:number_of_mentees] += 1
   mentor.save_changes(:validate => false)

   #Updates request DB 
   @requests = DB[:requests]
   @requests.each do |request|
      if request[:mentee_id] == mentee_id && request[:mentor_id] == id
         request = Request[request[:id]]
         request[:accepted] = 1
         request.save_changes
      elsif request[:mentee_id] == mentee_id
         request = Request[request[:id]]
         request.delete
      end
   end
   
   #Sends notification email to mentee
   require "net/http"

    def send_mail(email, subject, body)
      response = Net::HTTP.post_form(URI("http://www.dcs.shef.ac.uk/cgi-intranet/public/FormMail.php"),
                                     "recipients" => email,
                                     "subject" => subject,
                                     "body" => body)
      response.is_a? Net::HTTPSuccess
    end

    mentee["menteeEmail"] = params.fetch("menteeId", "").strip
    email = mentee["menteeEmail"]

    subject = "Accepted request"

    body = "One of your requests was accepted. Go check it on the website."


    send_mail(email, subject, body)
    
   redirect "/requests-mentor"
end

post "/rejectMethod" do
   #Updates mentee's DB details
   id = session[:id]
   mentee = Hash.new
   mentee["menteeId"] = params.fetch("menteeId", "").strip
   mentee_id = mentee["menteeId"].to_i
   mentee = Mentee[mentee_id]
   mentee[:number_of_rejections] += 1
   mentee.save_changes(:validate => false) 
   
   #Updates request DB 
   @requests = DB[:requests].where(mentor_id: id)
   @requests.each do |request|
      if request[:mentee_id] == mentee_id
         request = Request[request[:id]]
         request[:accepted] = 2
         request.save_changes
      end
   end

   redirect "/requests-mentor"
end
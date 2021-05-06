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

    puts "Sending email..."
    if send_mail(email, subject, body)
      puts "Email sent ok."
    else
      puts "Send failed."
    end
   
   redirect "/requests-mentor"
end

post "/rejectMethod" do
   id = session[:id]
   mentee = Hash.new
   mentee["menteeId"] = params.fetch("menteeId", "").strip
   mentee_id = mentee["menteeId"].to_i
   mentee = Mentee[mentee_id]
   mentee[:number_of_rejections] += 1
   mentee.save_changes(:validate => false) 
   
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
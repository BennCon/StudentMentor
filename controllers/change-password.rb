post "/change-password" do 
       
   user_data = Hash.new
   user_data["id"] = params.fetch("id", "").strip
   id = user_data["id"]
   user_data["password"] = params.fetch("password", "").strip 
   password = user_data["password"]
    

   user = User[id] if User.id_exists?(id)
   
   if user[:user_type] == "mentee"
        mentee = Mentee[id]
        mentee.load_passw_change(params)
        user.load_passw_change(params)

        mentee.save_changes(:validate => false)
        user.save_changes
        redirect "/all-mentees"
        erb :all_mentees
   end
    
   if user[:user_type] == "mentor" 
        mentor = Mentor[id]
        mentor.load_passw_change(params)
        user.load_passw_change(params)
        
        mentor.save_changes(:validate => false)
        user.save_changes
        redirect "/all-mentors"
        erb :all_mentors
   end  
end
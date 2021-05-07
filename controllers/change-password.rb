post "/change-password" do 
       
   user_data = Hash.new
   user_data["username"] = params.fetch("username", "").strip
   username = user_data["username"]
   user_data["password"] = params.fetch("password", "").strip 
   password = user_data["password"]
    
    
   user = User[username] if User.username_exists?(username)
   
   if user.get_type == "mentee" 
        mentee = Mentee[username]
        mentee.load_edit(params)
        user.load_edit(params)

        mentee.save_changes(:validate => false)
        user.save_changes
        redirect "/all-mentees"
        erb :all_mentees
   end
    
   if user.get_type == "mentor" 
        mentor = Mentor[username]
        mentor.load_edit(params)
        user.load_edit(params)

        mentor.save_changes(:validate => false)
        user.save_changes
        redirect "/all-mentors"
        erb :all_mentors
   end  
end
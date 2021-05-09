get "/mentor-form" do
   @user = User.new
   @mentor = Mentor.new
   erb :mentor_form
end

post "/mentor-form" do
   #Creates instances of both for the 2 databases
   @user = User.new
   @mentor = Mentor.new
   
   @user.load(params)
   @mentor.load(params)
   @user.user_type = "mentor"
   
   #Checks validation and creates account
   if @mentor.valid?
      @user.save_changes
      @mentor.save_changes(:validate => false)

      #Initial values
      @mentor.number_of_mentees = 0
      @mentor.seeking_mentee = 1
      id = @user.id
      @mentor.id = id

      @user.save_changes
      @mentor.save_changes(:validate => false)
      redirect "/success"
   end
   erb :mentor_form
end
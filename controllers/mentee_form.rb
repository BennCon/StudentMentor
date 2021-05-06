get "/mentee-form" do
   @user = User.new
   @mentee = Mentee.new
   erb :mentee_form
end

post "/mentee-form" do
   #Creates instances of both for the 2 databases
   @user = User.new
   @mentee = Mentee.new
   
   @user.load(params)
   @mentee.load(params)
   
   if @mentee.valid?
      @user.user_type = "mentee"
      @user.save_changes
      @mentee.save_changes(:validate => false)

      id = @user.id
      @mentee.id = id

      @user.save_changes
      @mentee.save_changes(:validate => false)
      redirect "/success"
   end
   erb :mentee_form
end
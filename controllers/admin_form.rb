get "/admin-form" do
   @user = User.new
   @admin = Admin.new
   @not_valid = ""
   erb :admin_form
end

post "/admin-form" do
   #Creates instances of both for the 2 databases
   @user = User.new
   @admin = Admin.new
   
   @user.load(params)
   @admin.load(params)
   @user.user_type = "admin"
   
#   Checks if admin code is valid
   if @admin.valid?
#      if @admin.valid_code?(@admin.admin_code)
        @user.save_changes
         @admin.save_changes

        id = @user.id
        @admin.id = id

        @user.save_changes
        @admin.save_changes
        redirect "/"
#      end
  end
   #Refreshes page if invalid

   erb :admin_form
end
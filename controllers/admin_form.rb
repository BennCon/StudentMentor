get "/admin-form" do
   @user = User.new
   @admin = Admin.new
   @not_valid = ""
   erb :admin_form
end

post "/admin-form" do
   @user = User.new
   @admin = Admin.new
   
   @user.load(params)
   @admin.load(params)
   @user.user_type = "admin"
   
   if @admin.valid_code?(@admin.admin_code)
      @user.save_changes
      @admin.save_changes

      id = @user.id
      @admin.id = id

      @user.save_changes
      @admin.save_changes
      redirect "/"
   end
   
   redirect "/admin-form"
   erb :admin_form
end
# I have to add this for tests to work - Charlie
require 'sinatra'

get "/admin-form" do
   @user = User.new
   @admin = Admin.new
   erb :admin_form
end

post "/admin-form" do
   @user = User.new
   @admin = Admin.new
   
   @user.load(params)
   @admin.load(params)
   @user.user_type = "admin"
   
   @user.save_changes
   @admin.save_changes
   
   id = @user.id
   @admin.id = id
   
   @user.save_changes
   @admin.save_changes
   redirect "/index"
   erb :admin_form
end
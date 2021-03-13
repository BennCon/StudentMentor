# I have to add this for tests to work - Charlie
require 'sinatra'

get "/mentee-form" do
   @user = User.new
   @mentee = Mentee.new
   erb :mentee_form
end

post "/mentee-form" do
   @user = User.new
   @mentee = Mentee.new
   
   @user.load(params)
   @mentee.load(params)
   @user.user_type = "mentee"
   
   @user.save_changes
   @mentee.save_changes
   
   id = @user.id
   @mentee.id = id
   
 
   @user.save_changes
   @mentee.save_changes
   redirect "/mentee-form"
   erb :mentee_form
end
# I have to add this for tests to work - Charlie
require 'sinatra'

get "/mentor-form" do
   @user = User.new
   @mentor = Mentor.new
   erb :mentor_form
end

post "/mentor-form" do
   @user = User.new
   @mentor = Mentor.new
   
   @user.load(params)
   @mentor.load(params)
   @user.user_type = "mentor"
   
   @user.save_changes
   @mentor.save_changes
   
   id = @user.id
   @mentor.id = id
   
   @user.save_changes
   @mentor.save_changes
   redirect "/mentor-form"
   erb :mentor_form
end
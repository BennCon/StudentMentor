# I have to add this for tests to work - Charlie
require 'sinatra'

get "/mentor-form" do
@mentor = Mentor.new
   erb :mentor_form
end

post "/mentor-form" do
   @mentor = Mentor.new
   @mentor.load(params)
   @mentor.save_changes
   redirect "/mentor-form"
   erb :mentor_form
end
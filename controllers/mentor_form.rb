get "/mentor-form" do
   @mentor = Mentor.new
   erb :mentor_form
end

post "/mentor-form" do
   @mentor = Mentor.new
   @mentor.load(params)
   @mentor.save_changes
   redirect "/mentor_form"
   erb :mentor_form
end
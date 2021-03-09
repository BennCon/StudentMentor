get "/mentee-form" do
   @mentee = Mentee.new
   erb :mentee_form
end

post "/mentee-form" do
   @mentee = Mentee.new
   @mentee.load(params)
   @mentee.save_changes
   redirect "/mentee-form"
   erb :mentee_form
end
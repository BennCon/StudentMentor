# I have to add this for tests to work - Charlie
require 'sinatra'

get "/mentee_form" do
   @mentee = Mentee.new
   erb :mentee_form
end

post "/mentee_form" do
   @mentee = Mentee.new
   @mentee.load(params)
   @mentee.save_changes
   redirect "/mentee_form"
   erb :mentee_form
end
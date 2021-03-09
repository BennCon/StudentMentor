# I have to add this for tests to work - Charlie
require 'sinatra'

get "/admin_form" do
   @admin = Admin.new
   erb :admin_form
end

post "/admin_form" do
   @admin = Admin.new
   @admin.load(params)
   @admin.save_changes
   redirect "/admin_form"
   erb :admin_form
end
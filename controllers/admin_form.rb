# I have to add this for tests to work - Charlie
require 'sinatra'

get "/admin-form" do
   @admin = Admin.new
   erb :admin_form
end

post "/admin-form" do
   @admin = Admin.new
   @admin.load(params)
   @admin.save_changes
   redirect "/admin-form"
   erb :admin_form
end